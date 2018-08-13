import React from 'react'

class CreditCardPayType extends React.Component {
    render() {
        return (
            <div>
                <div className="field">
                    <label htmlFor="order_credit_card_number">
                        {I18n.t("orders.form.credit_card_pay_type.cc_number")}
                    </label>

                    <input type="password"
                           className="form-control col-md-5"
                           name="order[credit_card_number]"
                           id="order_credit_card_number" />
                </div>
                <div className="field">
                    <label htmlFor="order_expiration_date">
                        {I18n.t("orders.form.credit_card_pay_type.expiration_date")}
                    </label>

                    <input type="text"
                           className="form-control col-md-5"
                           name="order[expiration_date]"
                           id="order_expiration_date"
                           size="9"
                           placeholder="e.g. 03/19" />
                </div>
            </div>
        );
    }
}
export default CreditCardPayType