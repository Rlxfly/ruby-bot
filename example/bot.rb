require 'telegram_bot'
require 'pp'
require 'logger'

logger = Logger.new(STDOUT, Logger::DEBUG)

bot = TelegramBot.new(token: '5581246695:AAFmcidZ5utpNeQE85PW6HahjKuWHtwqIH8', logger: logger)
logger.debug "Bot now is on!"

bot.get_updates(fail_silently: true) do |message|
    logger.info " @#{message.from.username}: #{message.text} "
    command = message.get_command_for(bot)

    message.reply do |reply|

        case command

        when /(hello|hi|bot|p|woi)/i
            reply.text = "Hello, #{message.from.first_name}! "

             when '/start'
                    reply.text = "Hello, #{message.from.first_name}! Im Re7Pntx beta Telegram bot by Re7, sorry if have some error's :/ \n\nUse /menu to see my feature~"

             when '/sc'
                reply.text = "You can use this bot in my github at: https://github.com/Rlxfly/ruby-bot"

             when /kontol/i
                reply.text = "🤨"

             when '/menu'
                reply.text = "━━━━━━━「List Menu」━━━━━━━\n\n\t➦ /sc - to see the source code of this bot\n\n\nBy Re7 - 2022"

        else
            reply.text = " #{message.from.first_name}, i don't know what you mean of #{command.inspect and "that"}, use /menu to see this feature of this bot"
        end
        logger.info "Sending #{reply.text.inspect} to @#{message.from.username}"
        reply.send_with(bot)
    end
end