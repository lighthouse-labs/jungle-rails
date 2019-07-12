class ReceiptMailerPreview < ActionMailer::Preview
    def sample_mail_preview
      ReceiptMailer.sample_email(User.first)
    end
  end