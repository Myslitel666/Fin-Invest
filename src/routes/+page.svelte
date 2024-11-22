<script lang="ts">
	import Box from './../components/Box.svelte';

	// Массив структур stocks
	let stocks = [
		{
			stockId: 1,
			stockTitle: 'Apple',
			stockLogo: 'https://via.placeholder.com/100',
			price: '15,000 ₽'
		},
		{
			stockId: 2,
			stockTitle: 'Google',
			stockLogo: 'https://via.placeholder.com/100',
			price: '12,000 ₽'
		},
		{
			stockId: 3,
			stockTitle: 'Microsoft',
			stockLogo: 'https://via.placeholder.com/100',
			price: '20,000 ₽'
		},
		{
			stockId: 2,
			stockTitle: 'Google',
			stockLogo: 'https://via.placeholder.com/100',
			price: '12,000 ₽'
		},
		{
			stockId: 3,
			stockTitle: 'Microsoft',
			stockLogo: 'https://via.placeholder.com/100',
			price: '20,000 ₽'
		},
		{
			stockId: 3,
			stockTitle: 'Microsoft',
			stockLogo: 'https://via.placeholder.com/100',
			price: '20,000 ₽'
		},
	];
</script>

<section>
	{#each stocks as stock}
		<Box
			stockId={stock.stockId}
			stockTitle={stock.stockTitle}
			stockLogo={stock.stockLogo}
			price={stock.price}
		/>
	{/each}
</section>

<style>
	section {
		display: flex;
		flex-direction: column;
		align-items: center;
		padding: 1rem;
		gap: 1rem; /* Расстояние между карточками */
	}
</style>
