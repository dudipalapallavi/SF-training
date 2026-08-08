# Chapter 7 – Bulk-Safe Apex

## Objective

Build Apex code that can safely process multiple Application records in a single transaction.

## Topics Covered

- Trigger.new
- Trigger Handler Pattern
- Service Layer
- Bulkification
- Set
- Map
- Bulk SOQL
- Bulk DML
- Governor Limits
- Application validation

## Architecture

Application Trigger
        ↓
Application Trigger Handler
        ↓
Application Service
        ↓
Bulk Validation
        ↓
Set + SOQL + Map
        ↓
Application Validation

## Implementation

The Application trigger receives a collection of Application records.

The handler passes the collection to the service layer.

The service:

1. Collects Student IDs.
2. Collects Job IDs.
3. Queries Students once.
4. Queries Jobs once.
5. Stores Students in a Map.
6. Stores Jobs in a Map.
7. Validates every Application.
8. Uses addError() for invalid records.

## Bulk Testing

The implementation was tested with:

- 1 Application
- 50 Applications
- 200 Applications

All bulk tests completed successfully.

## Key Learning

SOQL queries should not be placed inside processing loops.

Instead:

Set → Query → Map → Process

This approach makes the Apex code more scalable and bulk-safe.
