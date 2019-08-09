## master
- Migration database can now be a callable object
- Require sequel before attempting migration

## 0.4.0 (2017-11-19)
- Add `setup_hook` to run prior to migration command
- Lazy-eval database value
- Set `RACK_ENV` environment variable

## 0.3.0 (2017-07-06)
- Configurable migration logger
- Don't require inside migration tasks
- Configurable database constant
- Configurable tasks setup macro
- Configure individual tasks from global block
