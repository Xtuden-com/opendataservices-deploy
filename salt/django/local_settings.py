import private_settings

DEBUG = False
TEMPLATE_DEBUG = DEBUG
ASSETS_DEBUG = DEBUG
ASSETS_AUTO_BUILD = DEBUG

# used in admin template so we know which site we're looking at
DEPLOY_ENV = "production"
DEPLOY_ENV_NAME = "Production Server"

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',  # Add 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': 'validator',                      # Or path to database file if using sqlite3.
        'USER': 'validator',                      # Not used with sqlite3.
        'PASSWORD': private_settings.DB_PASSWORD,                  # Not used with sqlite3.
        'HOST': '',                      # Set to empty string for localhost. Not used with sqlite3.
        'PORT': '',                      # Set to empty string for default. Not used with sqlite3.
        'OPTIONS': {
            "init_command": "SET storage_engine=INNODB",
        }
    }
}

ADMINS = (
    ('Ben Webb', 'bjwebb67@googlemail.com'),
)

MANAGERS = ADMINS
