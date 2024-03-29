const getConversationQuery = """
  query GetConversations {
    getConversations {
      ... on GroupConversationSchema {
        id
        createdAt
        participants {
          id
          email
          password
          firstName
          lastName
          status
          name
        }
        messages {
          id
          sender {
            id
            email
            password
            firstName
            lastName
            status
            name
          }
          message
          unread
          createdAt
        }
        name
        owner {
          id
          email
          password
          firstName
          lastName
          status
          name
        }
        visibility
      }
      ... on DirectConversationSchema {
        id
        createdAt
        participants {
          id
          email
          password
          firstName
          lastName
          status
          name
        }
        messages {
          id
          sender {
            id
            email
            password
            firstName
            lastName
            status
            name
          }
          message
          unread
          createdAt
        }
      }
    }
  }
""";
