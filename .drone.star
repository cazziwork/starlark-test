def main(ctx):
  if ctx.build.branch == "master":
    return test("master")
  else:
    return test("etc")

def test(event):
  return {
    'kind': 'pipeline',
    'name': 'build',
    'steps': [
      {
        'name': event,
        'image': 'node:10.16.0-alpine',
        'commands': [
          "echo ${event}",
          'npm -v',
        ],
      },
    ],
  }
