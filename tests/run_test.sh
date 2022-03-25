grep -r "^scraper.*module" ../ | grep -v "/tests" | awk '{print $2}' | sort > /tmp/expected_modules
grep -r "^extends.*{" . | grep -v "/tests" | awk '{print $2}' | sort > /tmp/actual_modules

expected_modules_count=$(cat /tmp/expected_modules | wc -l)
actual_modules_count=$(cat /tmp/actual_modules | wc -l)

echo "Test report:"
echo "Number of modules: $expected_modules_count"
echo "Number of test extend blocks: $actual_modules_count\n"

if [ "$expected_modules_count" -ne "$actual_modules_count" ]; then
  echo "💥 There is a mismatch in the number of test extend blocks and actual modules"
  echo "If you have added a new module, make sure you also add a test extend block for it in tests/\n\nDiff:\n"
  diff -y --suppress-common-lines /tmp/expected_modules /tmp/actual_modules
  exit 1
fi

echo "All good 👍"
