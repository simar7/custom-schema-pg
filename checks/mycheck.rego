# METADATA
# title: Test check
# custom:
#   id: TEST001
#   avd_id: TEST001
#   severity: LOW
package user.test_json_check

deny[res] {
    input.service == "foo"
    res := result.new(`Service "foo" should not be used`, input.service)
}

deny[res] {
    input.wat == "wai"
    res := result.new(`Provider "wai" should not be used`, input.wat)
}
