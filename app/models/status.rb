class Status < ApplicationRecord
  belongs_to :order

  enum status: [:payment_pending, :payment_received, :sent, :delivered ]

  def status_label
    if self.payment_pending?
      "<label class='label label-warning'>Pago pendiente</label>"
    elsif self.payment_received?
      "<label class='label label-info'>Pago recibido</label>"
    elsif self.sent?
      "<label class='label label-primary'>Enviado</label>"
    elsif self.delivered?
        "<label class='label label-success'>Entregado</label>"
    else
      "<label class='label label-warning'>Sin actualizar</label>"
    end
  end

  def last
    self.inspect

  end
end
