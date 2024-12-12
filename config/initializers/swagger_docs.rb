Swagger::Docs::Config.register_apis({
                                        "1.0" => {
                                        "api_extension_type" => "json",
                                        "api_file_path" => "public/api/v1",
                                        "base_path" => "http://localhost:3001",
                                        "clean_directory" => false,
                                        "parent_controller" => Api::BaseController,
                                        "attributes" => {
                                          "info" => {
                                            "title" => "Documentacion de mi API",
                                            "description" => "Descripcion de mi API para gestionar recursos.",
                                            "termsOfServiceUrl" => "http://localhost:3001/terms",
                                            "contact" => "soporte@miempresa.com",
                                            "license" => "MIT",
                                            "licenseUrl" => "https://opensource.org/licenses/MIT"
                                          }
                                        }
                                      }
                                    })
