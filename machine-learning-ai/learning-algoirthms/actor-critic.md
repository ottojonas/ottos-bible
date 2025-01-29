---
modified: 2025-01-29T11:08:35.008Z
title: null
---

### Learning Reinforcement Learning

#### Key concepts in Reinforcement Learning

- **Agent**: The entity making decisions and interacting with the environment
- **Environment**: The external system where the agent interacts
- **State**: A representation of the current situation or configuration
- **Action**: The decision or move made by the agent
- **Reward**: The feedback received by the agent based on its actions
- **Policy**: The strategy or set of rules guiding the agent's decision making

#### Roles of Actor and Critic

- **Actor**:
  - Makes decisions based on current policy
  - Responsibility lies in exploring the action space
    - This maximises expected cumulative rewards
  - Refining the policy
    - Actor will adapt to the dynamic nature of the environment
- **Critic**:
  - Evaluates actions taken by the actor
  - Estimates the quality of these actions by providing feedback of their performance
  - Guides the actor towards actions that lead to higher expected returns
    - This contributes to overall improvement

#### Key terms in Actor Critic Algorithm

- **Policy**(Actor):
  - Represents the probability of taking action `a` in state `s`
    - Denoted as `π(a∣s)`
  - Actor seeks to maximise expected return by optimising this policy
  - Policy is modeled by the actor network
    - Parameters are denoted as `θ`
- **Value**(Critic):
  - Estimates the expected cumulative reward starting from state `s`
    - It is denoted as `V(s)`
  - The value function is modeled by the **critic network**
    - Parameters are denoted as `w`

#### How the Actor-Critic Algorithm Works

##### Objective Function

- Combination of **policy gradient** for the actor and **value function** for the critic
- Typically expressed as the **sum of two components**

###### Policy Gradient (Actor)

- _∇<sub>θ</sub>J(θ)≈<sup>1</sup>/<sub>N</sub>∑<sup>N</sup><sub>i=0</sub>∇<sub>θ</sub>log<sub>πθ</sub>(a<sub>i</sub> ∣ s<sub>i</sub>)⋅A(s<sub>i</sub>,a<sub>i</sub>)_
- Explanation:
  - _J(θ)_
    - Represents the expected return under the policy parameterized by θ
  - _π<sub>θ</sub>(a∣s)_
    - Represents the policy function
  - _N_
    - Represents the number of sampled experiences.
  - _A(s,a)_
    - Represents the advantage function representing the advantage of taking action a in state `s`.
  - _i_
    - Represents the number of samples

###### Value Function Update (Critic)

- _∇<sub>w</sub>J(w)≈<sup>1</sup>/<sub>N</sub>∑<sup>N</sup><sub>i=1</sub>∇<sub>w</sub>(V<sub>w</sub>(s<sub>i</sub>)−Q<sub>w</sub>(s<sub>i</sub>,a<sub>i</sub>))<sup>2</sup>_
- Explanation
  - _∇<sub>w</sub>J(w)_
    - Represents the gradient of loss function with respect to the critic's paramter `w`
  - _N_
    - Represents the number of samples
  - _V<sub>w</sub>(s<sub>i</sub>)_
    - Represents the critics estimate of value with state`s`using parameter`w`
  - _Q<sub>w</sub>(s<sub>i</sub>,a<sub>i</sub>))<sup>2</sup>_
    - Represents the critic's estimate of the action value of taking action`a`
  - _i_
    - Represents the index of the sample

##### Update Rules

- Involves adjusting the respective parametes for the actor and critic
  - Actor
    - Gradient ascent
  - Critic
    - Gradient descent

###### Actor Update

- _θ<sub>t+1</sub> = θ<sub>t</sub> + α∇<sub>θ</sub>J(θ<sub>t</sub>)_
- Explanation
  - _α_
    - learning the rate for the actor
  - _t_
    - time step within an episode

###### Critic Update

- _w<sub>t</sub> = w<sub>t</sub> − β∇<sub>w</sub>J(w<sub>t</sub>)_
- Explanation
  - _w_
    - Represents the parameters of the critic network
  - _β_
  - Represents the learning rate for the critic

#### Advantage Function

- The Advantage function _(A(s,a))_ measures the advantage of taking action `a` in state `s` over the expected value of the state under the current policy
- _A(s,a) = Q(s,a)−V(s)_
- The Advantage function then provides a measure of how much better or worse an action is compared to the average action
- Explanation of the _A(s,a) = Q(s,a)−V(s)_ expression
  - The actor is updated based on the policy gradient
    - Encouraging actions with higher advantages
  - The critic is updated to minimise the difference between the estimated value and action value

#### Advantage Actor-Critic(A2C)

- Introduces the concept of the **advantage function**
  - Measures how much better an action is compared to the average action in the given state
- Incorporating advantage information
  - A2C focuses the learning process on actions that have a significanlty higher value than the typical action taken in that state
- **Learning from average**:
  - Base Actor-Critic uses difference between **actual reward** and **estimated value** (critics evaluation) to update the actor
- **Learning from Advantage**:
  - Uses the difference between the action's value and the average calue of actions in that state
    - This additional information refines the learning process that little bit further

### Actor Critic Algorithm Steps

- ##### Initialisation
  - Initialise the parameters
    - Policy:
      - Actor
        - _θ_
    - Value Function
      - Critic
        - _ϕ_
- ##### Interaction with the elements
  - The agent interacts with the environment
    - Takes actions according to the current policy
      - Then rewarded in return
- ##### Advantage Computation
  - Compare the advantage function _A(s,a)_ based on the current policy and value estimates
- ##### Policy and Value Updates

  - Simultaneously update the actors parameters using the **policy gradient**

    - The policy gradient is derived from the advantage function
      - Guides the actor to increate the probabilities of actions that lead to higher advantages

  - Simultaneously update the critics parameters using a **value-based method**
    - The often involves minimising the **temporal difference** (TD) error
      - The difference between the observed rewards and the predicted values

> [!TIP]
>
> - The actor learns a policy
> - The critic then evaluates the actions taken by the actor
> - The actor is updated using the **policy gradient**
> - The critic is updated using the **value-based** method
>   > [!NOTE]
>   > Allows for more stable and efficient learning in complex environments

#### Training Agent: Actor-Critic Algorithm

> [!IMPORTANT]
> Makes use of TensorFlow and OpenAI Gym

1. Import libraries

```python
import numpy as np
import tensorflow as ts
import gym
```

2. Creating CartPole Environment

- `gym.make` provides a standardized and convenient way to interact with various reinforcement learning tasks

```python
env = gym.make('CartPole-v1')
```

3. Define Actor and Critic Networks

- Actor and Critic are implemented as **neural networks** using **TensorFlow's Keras API**
- Actor network
  - Maps the state or a probability distrobution over actions
- Critic network
  - Estimates the states value

```python
actor = tf.keraas.Sequential([
  tf.keras.layers.Dense(32, activation='relu'),
  tf.keras.layers.Dense(env.action_space.n, activation='softmax')
])
critic = tf.keras.Sequential([
  tf.keras.layers.Dense(32, activation='relu'),
  tf.keras.layers.Dense(1)
])
```

4. Defining Optimizers and Loss Functions

- Adam optimizer is used for both actor and critic networks

```python
actor_optimizer = tf.keras.optimizers.Adam(learning_rate=0.001)
critic_optimizer = tf.keras.optimizers.Adam(learning_rate=0.001
```

5. Training Loop

- The main training loop runs for specific number of **episodes** (1000)
- Agent interacts with the environment
  - For each episode:
    - Resets environment
    - Initializes the episode reward to 0
- The tf.GradientTape block
  - USed to compute gradients for both the actor and critic networks
- Agent chooses an action based on the actor's output probabilities
  - It then takes that action in the environment
- Observes:
  - Next state
  - Reward
  - Whether the episode is done
- Advantage function is computed
  - Difference between the expected return and the estimated value at the current state
- Actor and Critic losses are calculated based on the advantage function
- Gradients are computed using **tape.gradient**
  - Then applied to update the actor and critic networks using the respective optimisers
- Episodes total reward is updated and the loop is the continued until the episode ends
- Every 10 episodes the current episode number and reward are printed

```python
num_episodes = 1000
gamma = 0.99

for episode in range(num_episodes):
    state = env.reset()
    episode_reward = 0

    with tf.GradientTape(persistent=True) as tape:
        for t in range(1, 10000):  # Limit the number of time steps
            # Choose an action using the actor
            action_probs = actor(np.array([state]))
            action = np.random.choice(env.action_space.n, p=action_probs.numpy()[0])

            # Take the chosen action and observe the next state and reward
            next_state, reward, done, _ = env.step(action)

            # Compute the advantage
            state_value = critic(np.array([state]))[0, 0]
            next_state_value = critic(np.array([next_state]))[0, 0]
            advantage = reward + gamma * next_state_value - state_value

            # Compute actor and critic losses
            actor_loss = -tf.math.log(action_probs[0, action]) * advantage
            critic_loss = tf.square(advantage)

            episode_reward += reward

            # Update actor and critic
            actor_gradients = tape.gradient(actor_loss, actor.trainable_variables)
            critic_gradients = tape.gradient(critic_loss, critic.trainable_variables)
            actor_optimizer.apply_gradients(zip(actor_gradients, actor.trainable_variables))
            critic_optimizer.apply_gradients(zip(critic_gradients, critic.trainable_variables))

            if done:
                break

    if episode % 10 == 0:
        print(f&quot;Episode {episode}, Reward: {episode_reward}&quot;)

env.close()
```

#### Advantages of the Actor Critic Algorithm

- **Improved Sample Efficiience**
  - The hybrid nature of Actor-Clinic algorithms requires less interactions with the environment, often leading to achieve optimal performance
- **Faster Convergance**
  - The method is able to update both the **policy** and **value** function concurrently
    - This leads to faster convergance during training
      - Leading to quicker adaptation of the learning task
- **Versatility Across Action Spaces**
  - Actor-Clinic architectures are able to seamlessly handle both discrete and continuous action spaces
    - This offers flexibility in addressing a wide range of RL problems
- **Off-Policy Learning**
  - Learns from past experiences
    - Even when not directly following the current policy

### Advantage Actor Critic (A2C) vs. Asynchronous Actor Critic (A3C)

> [!NOTE]
> A3C builds upon A2C by introducing **_parallelism_**

- A2C uses a single actor-critic pair
- A3C uses multiple actor-critic pairs each operating simultaneously
  - Each pair interacts with a seperate copy of the environment collecting data independantly
    - These experiences are then used to update a global actor-critic network

### Applications of Actor Critic Algorithm

- **Robotics**
  - Empower robots to learn optimal control policies
    - Allows them to adapt and navigate complex environments
- **Game Playing**
  - Provides training agents to make strategic decisions
    - Improves gameplay overtime
- **Autonomous Vehicles**
  - Dynamic decisions in real-time
    - Contributes to the evolution of self-driving technology
- **Finance and Trading**
  - Optimize trading strategies and make intelligent financial decisions in dynamic markets
- **Healthcare**
  - Personalised treatment planning
    - Agents learn to make decisions that maximise patient outcome based on individual health profiles
