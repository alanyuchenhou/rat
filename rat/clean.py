from Bio import SeqIO
import pandas


def describe(file_name):
    sections = pandas.read_csv(file_name, header=None)
    print(sections.describe())
    print(sections[3].sum())


def get_indices(file_name, segment_length, n_regions):
    sections = pandas.read_csv(file_name, header=None, nrows=n_regions)
    regions = list(zip(sections[1].tolist(), sections[2].tolist()))
    indices = [list(), list()]
    for i in range(len(regions) - 1):
        positive_region = regions[i]
        negative_region = (regions[i][1], regions[i + 1][0])
        for index in range(positive_region[0], positive_region[1], segment_length):
            indices[1].append(index)
        for index in range(negative_region[0], negative_region[1], segment_length):
            indices[0].append(index)
    return indices


def get_segments(in_file, indices, segment_length):
    records = SeqIO.parse(in_file, "fasta")
    segments = pandas.DataFrame(columns=['label', 'position', 'sequence', ])
    for record in records:
        for label in [1, 0]:
            for index in indices[label]:
                segments.loc[len(segments)] = [label, index, str(record.seq[index:index + segment_length]), ]
    for column in ['label', 'position']:
        segments[column] = segments[column].astype(int)
    return segments


def main():
    # indices = get_indices('DMRs-germ-chr20.csv', 100, 10)
    # get_segments('rat-chr20.fa', indices, 100)
    describe('DMRs-germ-chr20.csv')


if __name__ == '__main__':
    main()
