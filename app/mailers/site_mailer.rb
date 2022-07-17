class SiteMailer < ApplicationMailer

  def send_site_mail(site, site_user)
    @site = site

    @mail = SiteMailer.new()
    mail(
      from: ENV['MAIL_ADDRESS'],
      to:   site_user.email,
      subject: '予定確認願い'
    )
  end

  def self.send_notifications_to_site_user(site)
    site.users.each do |site_user|
      SiteMailer.send_site_mail(site, site_user).deliver_now
    end
  end

end
