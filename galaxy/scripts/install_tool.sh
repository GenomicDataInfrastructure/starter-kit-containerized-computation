#!/bin/sh

sleep 30
curl -H "Content-Type: application/json" -H "X-Api-Key: fakekey" -X POST http://galaxy:80/api/tool_shed_repositories/new/install_repository_revision -d '{"tool_shed_url":"https://testtoolshed.g2.bx.psu.edu/", "name":"gdi_sk", "owner":"ljocha", "changeset_revision":"2715d228dfb5", "tool_panel_section_id":"getext", "install_tool_dependencies": true }'
