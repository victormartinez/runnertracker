from structlog import get_logger, processors

from runnertracker.application import RootView

from aiohttp import web


def run_app():
    app = init_app()
    web.run_app(app)


async def init_app(argv: str = None):
    app = web.Application()
    setup_routes(app)
    return app


def setup_routes(app):
    app.router.add_view("/", RootView)
