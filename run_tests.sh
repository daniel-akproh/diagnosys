# #!/usr/bin/env bash
# # Usage:  bash run_tests.sh
# set -euo pipefail

# SRC_DIR=src
# TESTS_DIR=tests
# UNITY_DIR=Unity-2.6.1/src
# BUILD_DIR=build

# mkdir -p "$BUILD_DIR"

# # 1) Compile production sources once
# src_objs=()
# for f in "$SRC_DIR"/*.c; do
#   [ -e "$f" ] || continue
#   obj="$BUILD_DIR/$(basename "${f%.c}").o"
#   gcc -I"$SRC_DIR" -c "$f" -o "$obj"
#   src_objs+=("$obj")
# done

# # 2) Compile Unity once
# gcc -I"$UNITY_DIR" -c "$UNITY_DIR/unity.c" -o "$BUILD_DIR/unity.o"

# # 3) For each test, build a dedicated exe and run it
# shopt -s nullglob
# tests=( "$TESTS_DIR"/Test*.c )
# if [ ${#tests[@]} -eq 0 ]; then
#   echo "No test files found in $TESTS_DIR (looking for Test*.c)." >&2
#   exit 1
# fi

# for t in "${tests[@]}"; do
#   base="$(basename "${t%.c}")"
#   test_obj="$BUILD_DIR/$base.o"
#   exe="$BUILD_DIR/$base.exe"   # .exe works fine on Windows; on Linux you can drop the suffix

#   gcc -I"$SRC_DIR" -I"$UNITY_DIR" -c "$t" -o "$test_obj"
#   gcc "$test_obj" "${src_objs[@]}" "$BUILD_DIR/unity.o" -o "$exe"

#   echo "=== Running $(basename "$t") ==="
#   "./$exe"
#   echo
# done

# echo "All tests finished."







#!/usr/bin/env bash
set -euo pipefail

SRC_DIR=src
TESTS_DIR=tests
UNITY_DIR=Unity-2.6.1/src
BUILD_DIR=build

mkdir -p "$BUILD_DIR"

# --- compile production sources (skip main.c) ---
src_objs=()
for f in "$SRC_DIR"/*.c; do
  [ -e "$f" ] || continue
  base="$(basename "$f")"
  [[ "$base" == "main.c" ]] && continue   # <-- avoid duplicate main during test links
  obj="$BUILD_DIR/${base%.c}.o"
  gcc -I"$SRC_DIR" -c "$f" -o "$obj"
  src_objs+=("$obj")
done

# --- compile Unity once ---
gcc -I"$UNITY_DIR" -c "$UNITY_DIR/unity.c" -o "$BUILD_DIR/unity.o"

# --- discover tests (case-insensitive patterns) ---
tests=()
for pat in "$TESTS_DIR"/Test*.c "$TESTS_DIR"/test*.c "$TESTS_DIR"/*_test.c; do
  for t in $pat; do
    [ -e "$t" ] || continue
    tests+=("$t")
  done
done

if [ ${#tests[@]} -eq 0 ]; then
  echo "No tests found under $TESTS_DIR."
  exit 1
fi

echo "Discovered test files:"
printf '  - %s\n' "${tests[@]}"

# --- build & run each test separately ---
for t in "${tests[@]}"; do
  base="$(basename "${t%.c}")"
  test_obj="$BUILD_DIR/$base.o"
  exe="$BUILD_DIR/$base.exe"

  gcc -I"$SRC_DIR" -I"$UNITY_DIR" -c "$t" -o "$test_obj"
  gcc "$test_obj" "${src_objs[@]}" "$BUILD_DIR/unity.o" -o "$exe"

  echo "=== Running $base ==="
  "./$exe"
  echo
done

echo "All tests finished."
read -rp "Press enter to close..."

