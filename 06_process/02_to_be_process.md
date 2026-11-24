# To-Be Complaint Process (proposal)

> DRAFT – prepared with Claude, pending review by Kumar. Proposed changes are design ideas to test, not proven fixes. Impact figures need the Bank's own data and cost assumptions (US-09).

## Design principles
1. Decide at day 1 whether a complaint is a quick fix or an investigation.
2. Let front-line handlers settle small, clear cases within a set limit.
3. Give investigations a clock, with escalation before day 40 (eight weeks is 56 days).
4. Route specialist products to specialist handlers.
5. Track the FCA bands internally every week.

## Flow
![To-be process](02_to_be_process.jpg)

Editable source: `02_to_be_process.drawio` (open in draw.io). Text version:

```mermaid
flowchart TD
    A[Customer complains] --> B[Log and acknowledge<br/>same day]
    B --> C[Triage on day 1<br/>score: simple, standard, complex]
    C -- Simple --> D[Front-line fast fix<br/>within delegated limit]
    C -- Standard --> E[Investigator queue<br/>with SLA clock]
    C -- Complex or specialist product --> F[Specialist team<br/>named owner]
    D --> G[Summary resolution<br/>by day 3]
    E --> H[Info request to product team<br/>48-hour response standard]
    F --> H
    H --> I[Decision and final response]
    I --> J{Day 40 reached<br/>and still open?}
    J -- Yes --> K[Team leader escalation<br/>and customer update]
    J -- No --> L[Close, pay redress if upheld]
    K --> L
    G --> M[Weekly MI: band mix,<br/>upheld share, root causes]
    L --> M
    M --> N[Feed root causes<br/>to product owners]
```

## Changes mapped to requirements and hypotheses
| Change | Addresses | Linked BR / US |
|---|---|---|
| Day-1 triage score | H1 | BR-10 / US-10 |
| Delegated settlement limit | H2 | BR-02, BR-09 |
| 48-hour product-team response standard | H3 | BR-02 |
| Specialist routing | H4 | BR-03 |
| Weekly band MI and root-cause loop | Monitoring | BR-01, BR-04 |

## Measures of success (targets TBC with the sponsor)
- Share closed within 3 days (benchmark: banking fastest quartile 59.2%; market 44.7%).
- Share over 8 weeks (market 5.5%).
- Share upheld tracked, not targeted (a target could push wrong outcomes).
