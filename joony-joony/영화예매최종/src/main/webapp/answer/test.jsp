<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.button {
  padding: 1em 1.5em;
  font-size: 1em;
  font-weight: 400;
  font-family: "Helvetica", "Arial", sans-serif;
  border-radius: 4px;
  cursor: pointer;
  appearance: none;
  border: none;
  color: #ffffff;
  margin-bottom: 20px;
}

.button-first {
  background: linear-gradient(to right, #e55d87, #5fc3e4);
  box-shadow: 0 2px 25px rgba(229, 93, 135, 0.5);
}

.button-first:active {
  background: linear-gradient(
    to right,
    rgba(229, 93, 135, 0.9),
    rgba(95, 195, 228, 0.9)
  );
}

.button-second {
  background: linear-gradient(to right, #1488cc, #2b32b2);
  box-shadow: 0 2px 25px rgba(20, 137, 204, 0.5);
}

.button-second:active {
  background: linear-gradient(
    to right,
    rgba(20, 136, 204, 0.9),
    rgba(43, 50, 178, 0.9)
  );
}

.button:focus {
  outline: none;
}

particle {
  left: 0;
  top: 0;
  pointer-events: none;
  position: fixed;
  opacity: 0;
}

.frame {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 400px;
  height: 400px;
  margin-top: -200px;
  margin-left: -200px;
  border-radius: 4px;
  box-shadow: 4px 8px 16px 0 rgba(0, 0, 0, 0.1);
  overflow: hidden;
  background: #fff;
  color: #333;
  font-family: "Open Sans", Helvetica, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.center {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);

  display: flex;
  flex-direction: column;
}

</style>
</head>
<body>
 <div class="frame">
      <div class="center">
        <button class="button button-first" data-type="square">
          Click on me
        </button>
        <button class="button button-second" data-type="circle">
          No, click on me
        </button>
      </div>
    </div>
    <script type="text/javascript">
    console.log(document.body.animate);
    if (document.body.animate) {
    	  document
    	    .querySelectorAll(".button")
    	    .forEach((button) => button.addEventListener("click", pop));
    	}

    	function pop(e) {
    	  for (let i = 0; i < 30; i++) {
    	    createParticle(e.clientX, e.clientY, e.target.dataset.type);
    	  }
    	}

    	function createParticle(x, y, type) {
    	  const particle = document.createElement("particle");
    	  document.body.appendChild(particle);

    	  const size = Math.floor(Math.random() * 20 + 5);

    	  particle.style.width = `${size}px`;
    	  particle.style.height = `${size}px`;

    	  const destinationX = x + (Math.random() - 0.5) * 2 * 75;
    	  const destinationY = y + (Math.random() - 0.5) * 2 * 75;

    	  switch (type) {
    	    case "square":
    	      particle.style.background = `hsl(${Math.random() * 90 + 270}, 70%, 60%)`;
    	      particle.style.border = "1px solid white";
    	      break;
    	    case "circle":
    	      particle.style.background = `hsl(${Math.random() * 90 + 180}, 70%, 60%)`;
    	      particle.style.borderRadius = "50%";
    	      break;
    	    default:
    	      particle.style.background = `hsl(${Math.random() * 90 + 180}, 70%, 60%)`;
    	  }

    	  const animation = particle.animate(
    	    [
    	      {
    	        // Set the origin position of the particle
    	        // We offset the particle with half its size to center it around the mouse
    	        transform: `translate(${x - size / 2}px, ${y - size / 2}px)`,
    	        opacity: 1,
    	      },
    	      {
    	        // We define the final coordinates as the second keyframe
    	        transform: `translate(${destinationX}px, ${destinationY}px)`,
    	        opacity: 0,
    	      },
    	    ],
    	    {
    	      duration: 500 + Math.random() * 1000,
    	      easing: "cubic-bezier(0, .9, .57, 1)",
    	      delay: Math.random() * 200,
    	    }
    	  );

    	  animation.onfinish = () => {
    	    particle.removeParticle;
    	  };
    	}

    	function removeParticle(e) {
    	  e.srcElement.effect.target.remove();
    	}

    </script>
</body>
</html>