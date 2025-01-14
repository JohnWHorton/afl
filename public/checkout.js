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