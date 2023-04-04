<!-- App GUI -->
<script>
	import { onMount, onDestroy } from 'svelte';
	import axios from 'axios';
	// export let data = [{}, {}];

	const endpoint_req = 'http://localhost:3000/v1/request';
	$: states = [{}];
	$: cities = [{}];
	$: curr_state = 'NC';
	$: curr_city = 'Huntersville';
	$: businesses = [{}];

	const res = {};
	// resfresh your_end_point_prop
	export async function load(fetch, params) {
		const res = await fetch(endpoint_req + `${params}`);
		const item = await res.json();
		return { item };
	}

	async function getStates() {
		try {
			/* get states */
            //res.states = await axios.get(endpoint_req);
            //states = res.states.data;
            res.states = await fetch(endpoint_req);
            states = await res.states.json();
			//states = load(fetch, '').then(states => states);
			console.log(states);
		} catch (error) {
			console.log('THERE IS AN ERROR.');
			console.error(error);
		} finally {
			console.log('successful fetched data.');
		}
	}

	async function getCities(state = 'NC') {
		curr_state = state;
		try {
			/* get states */
			//res.cities = await axios.get(endpoint_req + '?state=' + state);
			//cities = res.cities.data;
			res.cities = await fetch(endpoint_req + '?state=' + state);
			cities = await res.cities.json();
			console.log('curr_state=', curr_state);
			console.log(cities);
		} catch (error) {
			console.log('THERE IS AN ERROR.');
			console.error(error);
		} finally {
			console.log('successful fetched data.');
		}
	}

	async function getBusinesses(city = 'Huntersville') {
		curr_city = city;
		try {
			/* get states */
			/*res.businesses = await axios.get(
				endpoint_req + '?state=' + curr_state + '&' + 'city=' + city
			);
            businesses = res.businesses.data;*/
			res.businesses = await fetch(endpoint_req + '?state=' + curr_state + '&' + 'city=' + city);
			businesses = await res.businesses.json();
			console.log(businesses);
		} catch (error) {
			console.log('THERE IS AN ERROR.');
			console.error(error);
		} finally {
			console.log('successful fetched data.');
		}
	}

	onMount(async function () {
		/*
            // Default fetch API
			const res = await fetch(endpoint);
			const data = await res.json();
			posts = data;
        */
		curr_state = 'NC';
		curr_city = 'Huntersville';
		getStates();
	});
</script>

<!-- App GUI -->
<div class="app-container">
	<!-- LEFT PANEL: CITY LIST PER SELECTED STATE -->
	<div class="panel" id="left-panel">
		<h3>State List DropDown</h3>
		{#if curr_state}
			<select id="data-option-list" name="">
				{#each states as s, index (index)}
					<option id="s{index + 1}" on:click={() => getCities(s.state)}>{s.state}</option>
				{/each}
			</select>
			<h3>City List</h3>
			<select size="5" id="data-option-panel">
				{#await getCities() then}
					{#each cities as c, index (index)}
						<option id="s{index + 1}" value={c.city} on:click={() => getBusinesses(c.city)}
							>{c.city}</option
						>
					{/each}
				{/await}
			</select>
		{/if}
	</div>

	<!-- RIGHT PANEL: BUSINESS LIST PER SELECTED CITY -->
	<div class="panel">
		<h3>Business List</h3>
		<!--<select size="5" id="data-option-panel">-->
		<table>
			<tr>
				<th>Name</th>
				<th>Address</th>
				<th>Zipcode</th>
				<th>Rating</th>
				<th>Reviews</th>
				<th>Checkins</th>
			</tr>
			{#each businesses as b, index (index)}
				<tr>
					<td style="width:8%">{b.name}</td>
					<td style="width:10%">{b.address}</td>
					<td>{b.zipcode}</td>
					<td>{b.stars}</td>
					<td>{b.num_reviews}</td>
					<td>{b.num_checkins}</td>
				</tr>
			{/each}
		</table>
		<!--</select>-->
	</div>
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

	#data-option-panel {
		width: 90%;
		height: 50%;
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

	table {
	}

	tr {
	}

	th,
	td {
		text-align: left;
		width: 1%;
		border-bottom: solid black 1px;
		padding: 0 1% 0 1%;
		font-size: 16px;
	}
</style>
