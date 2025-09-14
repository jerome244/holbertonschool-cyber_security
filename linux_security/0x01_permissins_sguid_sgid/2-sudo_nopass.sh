#!/usr/bin/env bash
# setup_user.sh — create/manage a user, optional group/shared dir, optional NOPASSWD sudo
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: sudo ./setup_user.sh -u USER [-g GROUP] [-d DIR] [-N]

  -u USER   Username to create (or manage if it already exists)
  -g GROUP  Optional extra group to create and add USER to
  -d DIR    Optional shared directory to create and assign to GROUP
  -N        Grant password-less sudo (NOPASSWD:ALL) to USER

Notes:
- Run this script as root (via sudo).
- The password is read interactively (not stored in shell history).
- For proper Unix permissions, keep shared dirs on the Linux FS (e.g., /srv, /home).
EOF
}

USER_NAME=""
GROUP_NAME=""
SHARED_DIR=""
NOPASSWD=false

while getopts ":u:g:d:N" opt; do
  case "$opt" in
    u) USER_NAME="$OPTARG" ;;
    g) GROUP_NAME="$OPTARG" ;;
    d) SHARED_DIR="$OPTARG" ;;
    N) NOPASSWD=true ;;
    *) usage; exit 1 ;;
  endac
done 2>/dev/null || { usage; exit 1; }

# Basic checks
if [[ $EUID -ne 0 ]]; then
  echo "Please run as root (e.g., sudo $0 ...)" >&2
  exit 1
fi
if [[ -z "${USER_NAME}" ]]; then
  usage; exit 1
fi

# Create user if missing
if ! id -u "$USER_NAME" >/dev/null 2>&1; then
  useradd -m -s /bin/bash -U "$USER_NAME"
  echo "Created user $USER_NAME with home /home/$USER_NAME and shell /bin/bash"
else
  echo "User $USER_NAME already exists; skipping creation"
fi

# Ensure sudo group membership
if ! id -nG "$USER_NAME" | grep -qw sudo; then
  usermod -aG sudo "$USER_NAME"
  echo "Added $USER_NAME to group sudo"
fi

# Set password interactively
while :; do
  read -s -p "Set password for $USER_NAME: " PASS1; echo
  read -s -p "Confirm password: " PASS2; echo
  if [[ "$PASS1" == "$PASS2" ]]; then
    printf '%s:%s\n' "$USER_NAME" "$PASS1" | chpasswd
    unset PASS1 PASS2
    echo "Password set for $USER_NAME"
    break
  else
    echo "Passwords don't match, try again."
  fi
done

# Optional: create/join group and prepare shared directory
if [[ -n "${GROUP_NAME}" ]]; then
  if ! getent group "$GROUP_NAME" >/dev/null; then
    addgroup "$GROUP_NAME"
  else
    echo "Group $GROUP_NAME already exists; skipping creation"
  fi
  usermod -aG "$GROUP_NAME" "$USER_NAME"
  echo "Added $USER_NAME to group $GROUP_NAME"

  if [[ -n "${SHARED_DIR}" ]]; then
    mkdir -p "$SHARED_DIR"
    chown :"$GROUP_NAME" "$SHARED_DIR"
    chmod 2775 "$SHARED_DIR"
    echo "Prepared ${SHARED_DIR} (group=$GROUP_NAME, perms=2775 setgid)"
  fi
fi

# Optional: password-less sudo
if $NOPASSWD; then
  FILE="/etc/sudoers.d/${USER_NAME}"
  echo "${USER_NAME} ALL=(ALL) NOPASSWD:ALL" > "$FILE"
  chmod 440 "$FILE"
  visudo -cf "$FILE" >/dev/null && echo "Enabled NOPASSWD sudo for $USER_NAME"
fi

# Summary
echo
echo "Verification:"
id "$USER_NAME"
getent passwd "$USER_NAME" | cut -d: -f1,6,7
if [[ -n "${SHARED_DIR}" ]]; then ls -ld "$SHARED_DIR"; fi
echo "Done."
