from aiohttp import web
from structlog import get_logger

from runnertracker.application import RootView

logger = get_logger(__name__)


def run_app() -> None:
    logger.info("Starting application...")
    app = init_app()
    web.run_app(app)


async def init_app() -> web.Application:
    app = web.Application()
    setup_routes(app)
    return app


def setup_routes(app: web.Application) -> None:
    app.router.add_view("/", RootView)
