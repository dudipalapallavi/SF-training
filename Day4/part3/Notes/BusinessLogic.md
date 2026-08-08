# Business Logic – Chapter 7

## Application Validation

When Applications are created:

1. Salesforce sends the Application records to the trigger.
2. The trigger passes the records to the handler.
3. The handler calls the service layer.
4. The service collects Student and Job IDs.
5. Students and Jobs are queried in bulk.
6. The records are stored in Maps.
7. Each Application is validated.

## Eligibility

A Student is eligible when:

Student CGPA >= Job Minimum CGPA

## Deadline

An Application is invalid when:

Job Last Date < Today

## Error Handling

Invalid Applications receive an error using:

addError()

This prevents the invalid record from being saved.