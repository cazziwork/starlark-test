def main(ctx):
  if ctx.build.event == "push":
    return test("push")
  else:
    return test("etc")

def test(event):
  return {
    'kind': 'pipeline',
    'name': 'test',
    'steps': [
      {
        'name': 'build',
        'image': 'node:10.16.0-alpine',
        'commands': [
          "echo ${event}",
          'npm -v',
        ],
      },
    ],
  }
