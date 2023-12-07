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
"""

def compute_distances(query, database):
    results = np.empty(n_examples, dtype=np.uint64)
    for k,x in enumerate(database):
        results[k] = x - query   
    return results

if __name__ == '__main__':
    n_examples = 100_000_000
    n_features = 64
    database = np.empty((n_examples, n_features),  dtype=bool)
    # cast data to ImageHash object in order to use the - operator in compute_distances
    database = [imagehash.ImageHash(x) for x in database]

    # Benchmark hash creation
    time_per_hash_computation_sec = timeit.timeit('imagehash.dhash(images[0])', setup=setup_code, number=100)/100
    hashes_per_second = int(round(1/time_per_hash_computation_sec))

    # Benchmark distance computation
    t0 = time.time()
    q = database[1]
    res = compute_distances(q, database)
    sec_1billion_distances =  time.time() - t0

    print("\nBENCHMARK RESULTS")
    print(f"time taken to compute a hash using dhash: {round(time_per_hash_computation_sec,3)} seconds")
    print(f"Hashes per second: {hashes_per_second}")
    print(f"time taken to compute {n_examples} hash distances: {round(sec_1billion_distances,3)} seconds")
