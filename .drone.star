def main(ctx):
  if ctx.build.event == "tag":
    return test("PROD")
  else:
    return test("STAG")

def test(target):
  return {
    'kind': 'pipeline',
    'name': 'build',
    'steps': [
      {
        'name': target,
        'image': 'node:10.16.0-alpine',
        "environment": {"GREGORIO_TARGET": "from_secret": "GREGORIO_TARGET_" + target},
        'commands': [
          "echo $GREGORIO_TARGET",
          'npm -v',
        ],
      },
    ],
  }
