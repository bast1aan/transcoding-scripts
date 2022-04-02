threads="0"
sizes=""
frame_rate=""

while [ -n "$1" ]; do
    case "$1" in
        --threads|-t)
            shift;
            threads="$1";
            shift;;
        --frame-rate|-r)
            shift;
            frame_rate="-r $1";
            shift;;
        --360|-360)
            shift;
            sizes="$sizes 360";;
        --480|-480)
            shift;
            sizes="$sizes 480";;
        --720|-720)
            shift;
            sizes="$sizes 720";;
        --1080|-1080)
            shift;
            sizes="$sizes 1080";;
        --help|-h)
            print_help;
            exit;;
        *)
            break;;
    esac
done

in="$1"
base="$2"

if [ -z "$base" ]; then
	base="$in"
fi

if [ "$threads" -le 1 ]; then
	threads=0
fi

if [ -z "$sizes" ]; then
	sizes="360 480 720 1080"
fi

for size in $sizes; do
    case "$size" in
        360)
            run_360;;
        480)
            run_480;;
        720)
            run_720;;
        1080)
            run_1080;;
        *)
            echo "Unknown size $size";;
    esac
done
