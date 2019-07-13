class ReceiptMailerPreview < ActionMailer::Preview
    def receipt_mail_preview
      ReceiptMailer.receipt_email(User.first)
    end
  end