# ER Diyagramı (Kulüp ve Etkinlik Yönetim Sistemi)

```mermaid
erDiagram
    DEPARTMENT ||--o{ MEMBER : "has"
    MEMBER ||--o{ EVENT_REGISTRATION : "registers"
    EVENT ||--o{ EVENT_REGISTRATION : "has"

    DEPARTMENT {
        int department_id PK
        string department_name
    }

    MEMBER {
        int member_id PK
        string full_name
        string email
        int department_id FK
    }

    EVENT {
        int event_id PK
        string title
        int capacity
        date start_date
        date end_date
    }

    EVENT_REGISTRATION {
        int registration_id PK
        int member_id FK
        int event_id FK
        date registration_date
    }