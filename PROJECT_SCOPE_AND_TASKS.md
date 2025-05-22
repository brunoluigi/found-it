# FoundIT Project Scope & Task Management

_Last updated: 2025-05-10_

## Project Scope

FoundIT is a platform to register and track items. Its goal is to make it possible for users to create a PDF tag containing a QR code and basic information about an item. If somebody finds the item, they can scan the QR code to access FoundIT and report that the item was found.

### Design choices

- The platform should be simple and intuitive to use
- The platform should be accessible
- The platform should be secure
- The platform should be fast
- The platform should be responsive
- The platform should be mobile-friendly
- The design is inspired by the design of Camper shoe brand

### Key Objectives
- Develop an intuitive platform for users to register and manage their items
- Enable generation of PDF with printable tags containing QR codes and essential item info
- Allow finders to easily report found items by scanning the QR code
- Ensure privacy and security of user and item data
- Provide notifications or status updates to item owners when their item is reported found

## Current Tasks

| Task                                   | Status      | Owner  | Notes                |
|---------------------------------------- |------------ |--------|----------------------|
| Finalize MVP feature list               | To Do       | Bruno  |                      |
| Complete database schema                | To Do       | Bruno  |                      |
| Implement PDF generation                | To Do       |        |                      |
| Integrate QR code into PDF              | To Do       |        |                      |
| Implement found item reporting          | Done        | Bruno  | It's a public space, so it should be anonymous |
| Implement notifications                 | To Do       |        | Email or in-app?     |
| Unit Testing                            | To Do       | Luis   |                      |
| End-to-end flow testing                 | To Do       |        |                      |
| Update documentation                    | To Do       |        |                      |
| Prepare deployment                      | To Do       |        |                      |
| Design database schema                  | In Progress | Bruno  |                      |
| Set up project repo                     | Done        | Bruno  |                      |
| Implement authentication                | Done        | Bruno  |                      |
| Implement item registration             | Done        | Bruno  |                      |
| Implement QR code generation            | Done        |        |                      |

## Task Management
- Use this file to track progress and direction.
- Update the table above as tasks are started, completed, or reprioritized.
- Add new tasks as needed.

## Next Steps

1. **Finalize MVP Feature List**
    - Clearly define features for MVP: item registration, PDF/QR tag generation, public reporting, authentication, notifications.
2. **Complete Database Schema Design**
    - Finalize and document schema for users, items, tags, and reports.
3. **Implement PDF Generation**
    - Choose a PDF library and design tag layout.
    - Integrate QR code into the PDF.
4. **Implement Public Found Item Reporting**
    - Create a web endpoint/page for reporting found items via QR code.
    - Allow anonymous reporting and notify item owners.
5. **Implement Notifications/Status Updates**
    - Decide on and implement notification method (email, SMS, in-app).
6. **Polish and Test Core Flows**
    - Test full flow from registration to reporting and notification.
    - Fix usability issues.
7. **Documentation and Deployment**
    - Update documentation.
    - Prepare deployment scripts/instructions.
    - Set up demo environment if needed.

---

**Feel free to expand or modify this document as the project evolves!**
