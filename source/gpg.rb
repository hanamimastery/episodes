# frozen_string_literal: true

if system('gpg --version')
  puts 'gnupg already installed'
else
  puts 'Installing gpg via brew ...'
  system('brew install gnupg')
end
