# custom-schema-pg


## User provides schema (one good, one bad) via CLI flag, with two JSON files as scan input

```bash
 trivy config --misconfig-scanners=json,yaml --debug --config-check ./checks/mycheck.rego --config-file-schemas ./schemas/valid-schema.json,./schemas/invalid-schema.json  --check-namespaces user .
2024-09-04T23:30:03-06:00       DEBUG   Default config file "file_path=trivy.yaml" not found, using built in values
2024-09-04T23:30:03-06:00       DEBUG   Parsed severities       severities=[UNKNOWN LOW MEDIUM HIGH CRITICAL]
2024-09-04T23:30:03-06:00       INFO    [misconfig] Misconfiguration scanning is enabled
2024-09-04T23:30:03-06:00       DEBUG   [misconfig] Checks successfully loaded from disk
2024-09-04T23:30:03-06:00       DEBUG   Enabling misconfiguration scanners      scanners=[json yaml]
2024-09-04T23:30:03-06:00       DEBUG   Initializing scan cache...      type="memory"
2024-09-04T23:30:03-06:00       DEBUG   File matched schema     file_path="test1.json" schema_path="./schemas/valid-schema.json"
2024-09-04T23:30:03-06:00       DEBUG   Scanning files for misconfigurations... scanner="JSON"
2024-09-04T23:30:03-06:00       DEBUG   [rego] Overriding filesystem for checks
2024-09-04T23:30:03-06:00       DEBUG   [rego] Embedded libraries are loaded    count=11
2024-09-04T23:30:03-06:00       DEBUG   [rego] Embedded checks are loaded       count=508
2024-09-04T23:30:03-06:00       DEBUG   [rego] Checks from disk are loaded      count=196
2024-09-04T23:30:03-06:00       DEBUG   [rego] Overriding filesystem for data
2024-09-04T23:30:03-06:00       DEBUG   [rego] Scannning inputs count=1
2024-09-04T23:30:03-06:00       DEBUG   OS is not detected.
2024-09-04T23:30:03-06:00       INFO    Detected config files   num=1
2024-09-04T23:30:03-06:00       DEBUG   Scanned config file     file_path="test1.json"
2024-09-04T23:30:03-06:00       DEBUG   [vex] VEX filtering is disabled

test1.json (json)

Tests: 1 (SUCCESSES: 0, FAILURES: 1, EXCEPTIONS: 0)
Failures: 1 (UNKNOWN: 0, LOW: 1, MEDIUM: 0, HIGH: 0, CRITICAL: 0)

LOW: Service "foo" should not be used
════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```

## User does not provide schema, with two JSON files as scan input

```bash
trivy config --misconfig-scanners=json,yaml --debug --config-check ./checks/mycheck.rego   --check-namespaces user .
2024-09-04T23:29:51-06:00       DEBUG   Default config file "file_path=trivy.yaml" not found, using built in values
2024-09-04T23:29:51-06:00       DEBUG   Parsed severities       severities=[UNKNOWN LOW MEDIUM HIGH CRITICAL]
2024-09-04T23:29:51-06:00       INFO    [misconfig] Misconfiguration scanning is enabled
2024-09-04T23:29:51-06:00       DEBUG   [misconfig] Checks successfully loaded from disk
2024-09-04T23:29:51-06:00       DEBUG   Enabling misconfiguration scanners      scanners=[json yaml]
2024-09-04T23:29:51-06:00       DEBUG   Initializing scan cache...      type="memory"
2024-09-04T23:29:51-06:00       DEBUG   Scanning files for misconfigurations... scanner="JSON"
2024-09-04T23:29:51-06:00       DEBUG   [rego] Overriding filesystem for checks
2024-09-04T23:29:51-06:00       DEBUG   [rego] Embedded libraries are loaded    count=11
2024-09-04T23:29:52-06:00       DEBUG   [rego] Embedded checks are loaded       count=508
2024-09-04T23:29:52-06:00       DEBUG   [rego] Checks from disk are loaded      count=196
2024-09-04T23:29:52-06:00       DEBUG   [rego] Overriding filesystem for data
2024-09-04T23:29:52-06:00       DEBUG   [rego] Scannning inputs count=4
2024-09-04T23:29:52-06:00       DEBUG   OS is not detected.
2024-09-04T23:29:52-06:00       INFO    Detected config files   num=4
2024-09-04T23:29:52-06:00       DEBUG   Scanned config file     file_path="schemas/invalid-schema.json"
2024-09-04T23:29:52-06:00       DEBUG   Scanned config file     file_path="schemas/valid-schema.json"
2024-09-04T23:29:52-06:00       DEBUG   Scanned config file     file_path="test1.json"
2024-09-04T23:29:52-06:00       DEBUG   Scanned config file     file_path="test2.json"
2024-09-04T23:29:52-06:00       DEBUG   [vex] VEX filtering is disabled

test1.json (json)

Tests: 1 (SUCCESSES: 0, FAILURES: 1, EXCEPTIONS: 0)
Failures: 1 (UNKNOWN: 0, LOW: 1, MEDIUM: 0, HIGH: 0, CRITICAL: 0)

LOW: Service "foo" should not be used
════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────



test2.json (json)

Tests: 1 (SUCCESSES: 0, FAILURES: 1, EXCEPTIONS: 0)
Failures: 1 (UNKNOWN: 0, LOW: 1, MEDIUM: 0, HIGH: 0, CRITICAL: 0)

LOW: Provider "wai" should not be used
════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

```

## User provides schema (one good, one bad) via CLI flag, with one JSON and one YAML file as scan input
```bash
trivy config --misconfig-scanners=json,yaml --debug --config-check ./checks/mycheck.rego --config-file-schemas ./schemas/valid-schema.json,./schemas/invalid-schema.json  --check-namespaces user .
2024-09-04T23:39:06-06:00       DEBUG   Default config file "file_path=trivy.yaml" not found, using built in values
2024-09-04T23:39:06-06:00       DEBUG   Parsed severities       severities=[UNKNOWN LOW MEDIUM HIGH CRITICAL]
2024-09-04T23:39:06-06:00       INFO    [misconfig] Misconfiguration scanning is enabled
2024-09-04T23:39:06-06:00       DEBUG   [misconfig] Checks successfully loaded from disk
2024-09-04T23:39:06-06:00       DEBUG   Enabling misconfiguration scanners      scanners=[json yaml]
2024-09-04T23:39:06-06:00       DEBUG   Initializing scan cache...      type="memory"
2024-09-04T23:39:06-06:00       DEBUG   Skipping path   path=".git"
2024-09-04T23:39:06-06:00       DEBUG   File matched schema     file_path="test1.json" schema_path="./schemas/valid-schema.json"
2024-09-04T23:39:06-06:00       DEBUG   Scanning files for misconfigurations... scanner="JSON"
2024-09-04T23:39:06-06:00       DEBUG   [rego] Overriding filesystem for checks
2024-09-04T23:39:06-06:00       DEBUG   [rego] Embedded libraries are loaded    count=11
2024-09-04T23:39:06-06:00       DEBUG   [rego] Embedded checks are loaded       count=508
2024-09-04T23:39:06-06:00       DEBUG   [rego] Checks from disk are loaded      count=196
2024-09-04T23:39:06-06:00       DEBUG   [rego] Overriding filesystem for data
2024-09-04T23:39:06-06:00       DEBUG   [rego] Scannning inputs count=1
2024-09-04T23:39:06-06:00       DEBUG   File matched schema     file_path="test1.yaml" schema_path="./schemas/valid-schema.json"
2024-09-04T23:39:06-06:00       DEBUG   Scanning files for misconfigurations... scanner="YAML"
2024-09-04T23:39:06-06:00       DEBUG   [rego] Overriding filesystem for checks
2024-09-04T23:39:06-06:00       DEBUG   [rego] Embedded libraries are loaded    count=11
2024-09-04T23:39:06-06:00       DEBUG   [rego] Embedded checks are loaded       count=508
2024-09-04T23:39:06-06:00       DEBUG   [rego] Checks from disk are loaded      count=196
2024-09-04T23:39:06-06:00       DEBUG   [rego] Overriding filesystem for data
2024-09-04T23:39:06-06:00       DEBUG   [rego] Scannning inputs count=1
2024-09-04T23:39:06-06:00       DEBUG   OS is not detected.
2024-09-04T23:39:06-06:00       INFO    Detected config files   num=2
2024-09-04T23:39:06-06:00       DEBUG   Scanned config file     file_path="test1.json"
2024-09-04T23:39:06-06:00       DEBUG   Scanned config file     file_path="test1.yaml"
2024-09-04T23:39:06-06:00       DEBUG   [vex] VEX filtering is disabled

test1.json (json)

Tests: 1 (SUCCESSES: 0, FAILURES: 1, EXCEPTIONS: 0)
Failures: 1 (UNKNOWN: 0, LOW: 1, MEDIUM: 0, HIGH: 0, CRITICAL: 0)

LOW: Service "foo" should not be used
════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────



test1.yaml (yaml)

Tests: 1 (SUCCESSES: 0, FAILURES: 1, EXCEPTIONS: 0)
Failures: 1 (UNKNOWN: 0, LOW: 1, MEDIUM: 0, HIGH: 0, CRITICAL: 0)

LOW: Service "foo" should not be used
════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


```

## User does not provide schema, with one JSON and one YAML file as scan input
```bash
trivy config --misconfig-scanners=json,yaml --debug --config-check ./checks/mycheck.rego   --check-namespaces user . 
2024-09-04T23:41:34-06:00       DEBUG   Default config file "file_path=trivy.yaml" not found, using built in values
2024-09-04T23:41:34-06:00       DEBUG   Parsed severities       severities=[UNKNOWN LOW MEDIUM HIGH CRITICAL]
2024-09-04T23:41:34-06:00       INFO    [misconfig] Misconfiguration scanning is enabled
2024-09-04T23:41:34-06:00       DEBUG   [misconfig] Checks successfully loaded from disk
2024-09-04T23:41:34-06:00       DEBUG   Enabling misconfiguration scanners      scanners=[json yaml]
2024-09-04T23:41:34-06:00       DEBUG   Initializing scan cache...      type="memory"
2024-09-04T23:41:34-06:00       DEBUG   Skipping path   path=".git"
2024-09-04T23:41:34-06:00       DEBUG   Scanning files for misconfigurations... scanner="JSON"
2024-09-04T23:41:34-06:00       DEBUG   [rego] Overriding filesystem for checks
2024-09-04T23:41:34-06:00       DEBUG   [rego] Embedded libraries are loaded    count=11
2024-09-04T23:41:34-06:00       DEBUG   [rego] Embedded checks are loaded       count=508
2024-09-04T23:41:34-06:00       DEBUG   [rego] Checks from disk are loaded      count=196
2024-09-04T23:41:34-06:00       DEBUG   [rego] Overriding filesystem for data
2024-09-04T23:41:34-06:00       DEBUG   [rego] Scannning inputs count=4
2024-09-04T23:41:34-06:00       DEBUG   Scanning files for misconfigurations... scanner="YAML"
2024-09-04T23:41:34-06:00       DEBUG   [rego] Overriding filesystem for checks
2024-09-04T23:41:34-06:00       DEBUG   [rego] Embedded libraries are loaded    count=11
2024-09-04T23:41:34-06:00       DEBUG   [rego] Embedded checks are loaded       count=508
2024-09-04T23:41:34-06:00       DEBUG   [rego] Checks from disk are loaded      count=196
2024-09-04T23:41:34-06:00       DEBUG   [rego] Overriding filesystem for data
2024-09-04T23:41:34-06:00       DEBUG   [rego] Scannning inputs count=1
2024-09-04T23:41:34-06:00       DEBUG   OS is not detected.
2024-09-04T23:41:34-06:00       INFO    Detected config files   num=5
2024-09-04T23:41:34-06:00       DEBUG   Scanned config file     file_path="test1.json"
2024-09-04T23:41:34-06:00       DEBUG   Scanned config file     file_path="test2.json"
2024-09-04T23:41:34-06:00       DEBUG   Scanned config file     file_path="test1.yaml"
2024-09-04T23:41:34-06:00       DEBUG   Scanned config file     file_path="schemas/invalid-schema.json"
2024-09-04T23:41:34-06:00       DEBUG   Scanned config file     file_path="schemas/valid-schema.json"
2024-09-04T23:41:34-06:00       DEBUG   [vex] VEX filtering is disabled

test1.json (json)

Tests: 1 (SUCCESSES: 0, FAILURES: 1, EXCEPTIONS: 0)
Failures: 1 (UNKNOWN: 0, LOW: 1, MEDIUM: 0, HIGH: 0, CRITICAL: 0)

LOW: Service "foo" should not be used
════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────



test1.yaml (yaml)

Tests: 1 (SUCCESSES: 0, FAILURES: 1, EXCEPTIONS: 0)
Failures: 1 (UNKNOWN: 0, LOW: 1, MEDIUM: 0, HIGH: 0, CRITICAL: 0)

LOW: Service "foo" should not be used
════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────



test2.json (json)

Tests: 1 (SUCCESSES: 0, FAILURES: 1, EXCEPTIONS: 0)
Failures: 1 (UNKNOWN: 0, LOW: 1, MEDIUM: 0, HIGH: 0, CRITICAL: 0)

LOW: Provider "wai" should not be used
════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


