import os
import numpy as np
from PIL import Image
import timeit
import imagehash
import time

setup_code = """
import imagehash
import os
from PIL import Image

path_data = "Datasets/ecommerce_product_images/Footwear/Men/Images/images_with_product_ids"
path_data = os.path.join(os.path.expanduser("~"), path_data)
paths = os.listdir(path_data)[0:10]
images = [Image.open(os.path.join(path_data, p)) for p in paths];
image = images[0]
"""

def compute_distances(q, database):
    results = np.empty(n_examples, dtype=np.uint64)
    for k,x in enumerate(database):
        results[k] = x - q    
    return results

if __name__ == '__main__':
   
    # Benchmark hash creation
    seconds_hash_computation = timeit.timeit('imagehash.dhash(images[1])', setup=setup_code, number=100)/100
    hashes_per_second =  int(round(1/seconds_hash_computation))

    # Benchmark Distance computation
    n_examples = 1_000_000_000
    database = np.empty(n_examples, dtype=np.uint64)
    q = database[0]
    t0 = time.time()
    res = compute_distances(q, database)
    sec_1billion_distances =  time.time() - t0

    print("\nBENCHMARK RESULTS")
    print(f"time taken to compute a hash: {seconds_hash_computation} seconds")
    print(f"Hashes per second: {hashes_per_second}")
    print(f"time taken to compute 1 billion hash distances: {sec_1billion_distances} seconds")




