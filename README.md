# Hanami Mastery Episodes souce codes

This repository contains source code for all episodes we released.

## Usage

We heavily rely on git tags to switch between code versions. See CHANGELOG for links to each episode diffs.

Tag structure:

```ruby
HME<<ID>>(-pre)(.v<<version_number>>)
```

Examples

- HME001-pre
- HME001
- HME001-pre.v2
- HME001-v2

This way you can easily compare the code of any 2 episodes, and any versions using github link:

```ruby
https://github.com/hanamimastery/episodes/tree/<<TAG>>
# @example
https://github.com/hanamimastery/episodes/tree/HME001
```

To compare two code bases together, use the link below:

```ruby
https://github.com/hanamimastery/episodes/compare/<BASE_TAG>...<TARGET_TAG>
https://github.com/hanamimastery/episodes/compare/HME001-pre...HME001
```

### Scaffold applications

We use numerous scaffold applications for our code samples,
