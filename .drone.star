def main(ctx):
  if ctx.branch == "master":
    return test("master")
  else:
    return test("etc")

def test(branch):
  return {
    'kind': 'pipeline',
    'name': 'test',
    'steps': [
      {
        'name': 'build',
        'image': 'node:10.16.0-alpine',
        'commands': [
          'echo $branch'
          'npm -v',
        ],
      },
    ],
  }
