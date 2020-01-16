def main(ctx):
  if ctx.build.event == "tag":
    return test("tag")
  else:
    return test("etc")
    
def test(tag):
  return {
    'kind': 'pipeline',
    'name': 'test',
    'steps': [
      {
        'name': tag,
        'image': 'node:10.16.0-alpine',
        'environment': {'TARGET': secret("TARGET_" + target)},
        'commands': [
          'npm $TARGET',
        ],
      },
    ],
  }
