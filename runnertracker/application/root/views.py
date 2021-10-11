from http import HTTPStatus

from aiohttp import web


class RootView(web.View):
    async def get(self) -> web.Response:
        return web.json_response({"healthy": True}, status=HTTPStatus.OK)
