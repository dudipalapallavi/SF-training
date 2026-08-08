# Engineering Sprint – Bulk-Safe Apex

## Goal

Build Apex that handles multiple Application records safely within Salesforce governor limits.

## Tasks Completed

- [x] Receive Application collection through Trigger.new
- [x] Create Trigger Handler
- [x] Create service-layer validation
- [x] Collect Student IDs using Set
- [x] Collect Job IDs using Set
- [x] Query Students in bulk
- [x] Query Jobs in bulk
- [x] Store Students in Map
- [x] Store Jobs in Map
- [x] Validate Applications
- [x] Avoid SOQL inside processing loops
- [x] Test single Application
- [x] Test 50 Applications
- [x] Test 200 Applications
- [x] Deploy successfully

## Result

The Application validation logic was converted into a bulk-safe design capable of processing multiple records in a single transaction.