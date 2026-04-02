sed -i.bak \
  -e "s|ppl_cppflags = .*|ppl_cppflags = run_command('sh', ['-c', 'echo \$CPPFLAGS'], check: true).stdout().strip().split()|" \
  -e "s|ppl_prefix = .*|ppl_prefix = run_command('sh', ['-c', 'echo \$PREFIX'], check: true).stdout().strip()|" \
  meson.build

python -m pip install . -vv \
  --no-build-isolation \
  --config-settings=setup-args=--wrap-mode=nofallback \
  -Csetup-args=${MESON_ARGS// / -Csetup-args=} \
