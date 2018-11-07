DATA_DIR=data
MODEL_DIR=models
rm -Rf $MODEL_DIR
mkdir -p $MODEL_DIR
python -m sockeye.train\
                       --source $DATA_DIR/shakespeare/sparknotes/merged/modernShuffled.txt \
                       --target $DATA_DIR/shakespeare/sparknotes/merged/originalShuffled.txt \
                       --encoder cnn \
                       --decoder cnn \
					   --cnn-activation-type relu \
                       --rnn-num-hidden 2 \
					   --rnn-attention-type bilinear \
					   --max-num-epochs 300 \
                       --validation-source $DATA_DIR/shakespeare/sparknotes/merged/modernVal.txt \
                       --validation-target $DATA_DIR/shakespeare/sparknotes/merged/originalVal.txt \
                       --output $MODEL_DIR \
                       --decode-and-evaluate 500
