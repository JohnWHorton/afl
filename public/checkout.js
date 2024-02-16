// This is your test publishable API key.
// const stripe = Stripe("pk_test_51OBZslDol7H5bJPd7oj9015jzI7qJr3b1iLC7HTrogxiUhq7kYggUZPtfVszdxt3vRxPyUAgLTHwygSnUN31r09Y00AFYYhnHc");
const stripe = Stripe(process.env.STRIPE_PUBLISHABLE_KEY);

initialize();

// Create a Checkout Session as soon as the page loads
async function initialize() {
  const response = await fetch("/public/checkout.php", {
    method: "POST",
  });

  const { clientSecret } = await response.json();

  const checkout = await stripe.initEmbeddedCheckout({
    clientSecret,
  });

  // Mount Checkout
  checkout.mount('#checkout');
}