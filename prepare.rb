# frozen_string_literal: true
# Add work directory in $LOAD_PATH
$LOAD_PATH.unshift(__dir__) unless $LOAD_PATH.include?(__dir__)

$LARK_WORKDIR = File.expand_path(File.path(__dir__))

