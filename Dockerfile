# Usa una imagen base de Ruby

FROM ruby:1.9.3

# Configuración para manejar repositorios antiguos
# Usa una versión más reciente de Debian (por ejemplo, buster o bullseye)
RUN echo "deb [trusted=yes] http://deb.debian.org/debian buster main" > /etc/apt/sources.list && \
    echo "deb [trusted=yes] http://security.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential libpq-dev libsqlite3-dev postgresql-client && \
    rm -rf /var/lib/apt/lists/*




# Configura el directorio de trabajo
WORKDIR /app

# Copia el Gemfile y Gemfile.lock al contenedor
COPY Gemfile Gemfile.lock ./

# Instala las dependencias
RUN gem install bundler -v 1.17.3  && bundle install --jobs 4 --retry 5     

# Copia el resto del proyecto (si es necesario)
COPY . .
EXPOSE 3001

# Comando para iniciar Rails (si la app ya existe)
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3001"]


