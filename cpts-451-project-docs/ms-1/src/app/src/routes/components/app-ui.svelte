<!-- App GUI -->
<script>
	import { onMount } from 'svelte';
	import axios from 'axios';
	// export let data = [{}, {}];

	const endpoint = 'https://jsonplaceholder.typicode.com/posts';
	let posts = [{}];

	onMount(async function () {
		/*
            // Default fetch API
			const res = await fetch(endpoint);
			const data = await res.json();
			posts = data;
        */
		// axios
		try {
			const res = await axios.get(endpoint);
			/*console.log(res.data);*/
			posts = res.data;
		} catch (error) {
			console.error(error);
		} finally {
			console.log('successful fetched data.');
		}
	});
</script>

<!-- App GUI -->
<div style="text-align:center">
	<h1>Welcome to My Yelp Business Data App!</h1>
</div>

<div class="app-container">
	<!-- LEFT PANEL: CITY LIST PER SELECTED STATE -->
	<div class="panel" id="left-panel">
		<h2>State List DropDown</h2>
		<select id="data-option-list" name="">
			{#each Array(5) as _, index (index)}
				<option id="item0{index + 1}" value="">State 0{index + 1}</option>
			{/each}
		</select>
		<h2>City List</h2>
		<div class="card">Card 2</div>
	</div>

	<!-- RIGHT PANEL: BUSINESS LIST PER SELECTED CITY -->
	<div class="panel">
		<h2>City List DropDown</h2>
		<select id="data-option-list" name="">
			{#each Array(5) as _, index (index)}
				<option id="item0{index}" value="">City 0{index}</option>
			{/each}
		</select>
		<h2>Business List</h2>
		<div class="card">Card 4</div>
	</div>
</div>

<!-- TEST DATA: first 5 items -->
<div id="test-data" class="panel">
	{#each posts.slice(0, 5) as article}
		<div>
			<p>{JSON.stringify(article)}</p>
		</div>
	{/each}
</div>

<!-- Style Sheet -->
<style>
	.app-container {
		/*text-align: center;*/
		width: 95%;
		min-height: 95%;
		display: flex;
		margin-left: 2%;
		margin-right: 2%;
		font-size: 18px;
	}

	.panel {
		border: 5px solid gray;
		width: 1000px;
		min-height: 95%;
		margin: 5px 5px;
		padding: 2% 2%;
		flex-direction: row wrap;
		border-radius: 25px;
	}

	.card {
		width: 400px;
		height: 200px;
		border: 5px dotted red;
		margin: 10px 10px;
		padding: 10px 10px;
		border-radius: 25px;
	}

	#data-option-list {
		width: 90%;
		height: 50px;
		margin-left: 2%;
		margin-right: 2%;
		margin-bottom: 5%;
		font-size: 1rm;
	}

	#left-panel {
		width: unset;
		width: 40%;
	}

	select {
		border-radius: 10px;
		font-size: 1em;
	}

	#test-data {
		display: unset;
		display: inline-block;
	}
</style>
