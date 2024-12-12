# app/swagger/api/products_swagger.rb

SwaggerDocs::Config.add_api(
  path: '/api/v1/products',
  methods: {
    get: {
      summary: 'Get top purchases by category',
      description: 'Returns the top purchased products by category.',
      response: {
        code: 200,
        message: 'Success',
        schema: {
          type: 'array',
          items: {
            type: 'object',
            properties: {
              category: { type: 'string' },
              top_products: {
                type: 'array',
                items: {
                  type: 'object',
                  properties: {
                    id: { type: 'integer' },
                    name: { type: 'string' },
                    total_quantity: { type: 'integer' }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
)
