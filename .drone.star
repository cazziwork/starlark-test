def main(ctx):
  return [
    test(ctx),
  ]

def test(ctx):
  return {
    'kind': 'pipeline',
    'name': 'test',
    'steps': [
      {
        'name': 'build',
        'image': 'node:10.16.0-alpine',
        'commands': [
          'npm -v',
        ],
      },
    ],
  }
