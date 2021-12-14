module GC
  # --- garbage_collect(full_mark: true, immediate_sweep: true) -> nil
  # 
  # ガーベージコレクトを開始します。
  # 
  # [[m:GC.start]] や [[m:ObjectSpace.#garbage_collect]] と同じ働きをします。
  # [[m:GC.disable]] により GC が禁止されている場合でもガベージコレクトを開始します。
  # 
  # nil を返します。
  # 
  # @param full_mark マイナー GC を動作させる場合は false を、そうでない場
  #                  合は true を指定します。
  # 
  # @param immediate_sweep sweep を遅らせる(Lazy Sweep を行う)場合は false
  #                        を、そうでない場合は true を指定します。
  # 
  # 注意: これらのキーワード引数は Ruby の実装やバージョンによって異なりま
  # す。将来のバージョンとの互換性も保証されません。また、Ruby の実装がサポー
  # トしていない場合はキーワード引数を指定しても無視される可能性があります。
  # 
  # //emlist[例][ruby]{
  # include GC
  # GC.count  # => 3
  # garbage_collect
  # GC.count  # => 4
  # //}
  def garbage_collect; end

  # --- compact -> Hash
  # 
  # ヒープをコンパクションします。
  # 
  # 詳細は[[feature:15626]]を参照してください。
  # 
  # @see [[m:GC.verify_compaction_references]]
  def compact; end

  # --- count -> Integer
  # 
  # プロセス開始からガーベージコレクトを実行した回数を [[c:Integer]] で返し
  # ます。
  # 
  # //emlist[例][ruby]{
  # GC.count # => 3
  # //}
  def count; end

  # --- disable -> bool
  # 
  # ガーベージコレクトを禁止します。
  # 
  # 前回の禁止状態を返します(禁止されていたなら true, GC が有効であったなら、
  # false)。
  # 
  # //emlist[例][ruby]{
  # GC.disable   # => false
  # GC.disable   # => true
  # //}
  # 
  # @see [[m:GC.enable]]
  def disable; end

  # --- enable -> bool
  # 
  # ガーベージコレクトを許可します。
  # 
  # 前回の禁止状態を返します(禁止されていたなら true, GC が有効であったなら、
  # false)。
  # 
  # @see [[m:GC.disable]]
  # 
  # //emlist[例][ruby]{
  # GC.disable   # => false
  # GC.enable    # => true
  # GC.enable    # => false
  # //}
  def enable; end

  # --- latest_gc_info(result_hash = {}) -> Hash
  # --- latest_gc_info(key)              -> object
  # 
  # 最新のGCの情報を返します。
  # 
  # @param result_hash 戻り値のためのハッシュを指定します。省略した場合は新
  #                    しくハッシュを作成します。result_hash の内容は上書き
  #                    されます。
  # 
  # @param key 得られる情報から特定の情報を取得したい場合にキーを
  #            [[c:Symbol]] で指定します。
  # 
  # //emlist[例][ruby]{
  # latest = GC.latest_gc_info
  # latest # => {:major_by=>nil, :gc_by=>:newobj, :have_finalizer=>false, :immediate_sweep=>false, :state=>:sweeping}
  # 
  # stat = GC.stat
  # merged = GC.latest_gc_info(stat)
  # merged == latest.merge(stat) # => true
  # 
  # GC.latest_gc_info(:gc_by)    # => :newobj
  # //}
  def latest_gc_info; end

  # --- start(full_mark: true, immediate_sweep: true) -> nil
  # 
  # ガーベージコレクトを開始します。
  # 
  # [[m:GC#garbage_collect]] や [[m:ObjectSpace.#garbage_collect]] と同じ働きをします。
  # [[m:GC.disable]] により GC が禁止されている場合でもガベージコレクトを開始します。
  # 
  # nil を返します。
  # 
  # @param full_mark マイナー GC を動作させる場合は false を、そうでない場
  #                  合は true を指定します。
  # 
  # @param immediate_sweep sweep を遅らせる(Lazy Sweep を行う)場合は false
  #                        を、そうでない場合は true を指定します。
  # 
  # 注意: これらのキーワード引数は Ruby の実装やバージョンによって異なりま
  # す。将来のバージョンとの互換性も保証されません。また、Ruby の実装がサポー
  # トしていない場合はキーワード引数を指定しても無視される可能性があります。
  # 
  # //emlist[例][ruby]{
  # GC.count  # => 3
  # GC.start  # => nil
  # GC.count  # => 4
  # //}
  def start; end

  # --- stat(result_hash = {}) -> {Symbol => Integer}
  # --- stat(key) -> Numeric
  # 
  # GC 内部の統計情報を [[c:Hash]] で返します。
  # 
  # @param result_hash 戻り値のためのハッシュを指定します。省略した場合は新
  #                    しくハッシュを作成します。result_hash の内容は上書き
  #                    されます。
  # 
  # 
  # @param key 得られる統計情報から特定の情報を取得したい場合にキーを
  #            [[c:Symbol]] で指定します。
  # 
  # @return GC 内部の統計情報を[[c:Hash]] で返します。
  #         引数 key を指定した場合は数値を返します。
  # 
  #   GC.stat
  #   # =>
  #    {
  #      :count=>0,
  #      :heap_allocated_pages=>24,
  #      :heap_sorted_length=>24,
  #      :heap_allocatable_pages=>0,
  #      :heap_available_slots=>9783,
  #      :heap_live_slots=>7713,
  #      :heap_free_slots=>2070,
  #      :heap_final_slots=>0,
  #      :heap_marked_slots=>0,
  #      :heap_swept_slots=>0,
  #      :heap_eden_pages=>24,
  #      :heap_tomb_pages=>0,
  #      :total_allocated_pages=>24,
  #      :total_freed_pages=>0,
  #      :total_allocated_objects=>7796,
  #      :total_freed_objects=>83,
  #      :malloc_increase_bytes=>2389312,
  #      :malloc_increase_bytes_limit=>16777216,
  #      :minor_gc_count=>0,
  #      :major_gc_count=>0,
  #      :remembered_wb_unprotected_objects=>0,
  #      :remembered_wb_unprotected_objects_limit=>0,
  #      :old_objects=>0,
  #      :old_objects_limit=>0,
  #      :oldmalloc_increase_bytes=>2389760,
  #      :oldmalloc_increase_bytes_limit=>16777216
  #    }
  # 
  # 戻り値のハッシュは処理系に依存します。これは将来変更になるかもしれません。
  # 
  # 本メソッドは C Ruby 以外では動作しません。
  def stat; end

  # --- stress -> bool
  # 
  # GCがストレスモードかどうかを返します。
  # 
  # 真が設定されている場合は GC を行えるすべての機会に GC を行います。
  # 
  # @see [[m:GC.stress=]]
  def stress; end

  # --- stress=(value)
  # 
  # GCのストレスモードを引数 value に設定します。
  # 引数 value が真に設定されている間は、GC を行えるすべての機会に GC を行います。
  # 
  # この機能はデバッグ用途に提供されています。ストレスモードを有効にすると
  # プログラムのパフォーマンスが低下します。
  # 
  # @param value 任意のオブジェクト。整数以外の値を指定した場合は真偽値として解釈されます。
  #              整数を指定する場合は以下のフラグをOR演算した値を指定します。
  # : 0x01
  #   マイナー GC を動作させる場合に指定します。
  # : 0x02
  #   sweep を遅らせる(Lazy Sweep を行う)に指定します。
  # : 0x04
  #   malloc/calloc/realloc の後でメジャーGCを動作させる場合に指定します。
  # 
  # //emlist[例][ruby]{
  # GC.stress # => false
  # GC.stress = true
  # GC.stress # => true
  # //}
  # 
  # @see [[m:GC.stress]]
  def stress=; end

  # --- verify_compaction_references(toward: nil, double_heap: nil) -> Hash
  # 
  # コンパクションの参照の一貫性を検証します。
  # 
  # このメソッドは処理系依存 (CRuby 特有) です。
  # コンパクション中に移動されたオブジェクトは T_MOVED オブジェクトに置き換えられます。
  # コンパクション後には T_MOVED を参照するオブジェクトは存在するべきではありません。
  # 
  # この関数は全てのオブジェクトが移動する余地を確保するためにヒープを2倍にして、
  # 全ての移動を確実にするためにヒープをコンパクションして、全ての参照を更新して、
  # それからフルGCを実行します。
  # もし T_MOVED への参照をもつオブジェクトがあれば、マークスタックにプッシュされて、
  # SEGV が起きるでしょう。
  # 
  # @param toward nil か :empty を指定します。
  # @param double_heap ヒープサイズを2倍にするかどうかを真偽値で指定します。
  # 
  # @return [[m:GC.compact]] の返り値と同じです。
  # 
  # @see [[m:GC.compact]]
  def verify_compaction_references; end

  # --- INTERNAL_CONSTANTS -> {Symbol => Integer}
  # 
  # GC用内部定数の値を保持するハッシュテーブルです。
  # 
  #   GC::INTERNAL_CONSTANTS
  #   # => {:RVALUE_SIZE=>40, :HEAP_PAGE_OBJ_LIMIT=>408, :HEAP_PAGE_BITMAP_SIZE=>56, :HEAP_PAGE_BITMAP_PLANES=>4}
  def INTERNAL_CONSTANTS; end

  # --- OPTS -> [String]
  # 
  # コンパイル時に指定したGCのオプションです。
  # 
  # 可能性があるオプション文字列は以下の通りです。
  # 
  #   * "GC_DEBUG"
  #   * "USE_RGENGC"
  #   * "RGENGC_DEBUG"
  #   * "RGENGC_CHECK_MODE"
  #   * "RGENGC_PROFILE"
  #   * "RGENGC_ESTIMATE_OLDMALLOC"
  #   * "GC_PROFILE_MORE_DETAIL"
  #   * "GC_ENABLE_LAZY_SWEEP"
  #   * "CALC_EXACT_MALLOC_SIZE"
  #   * "MALLOC_ALLOCATED_SIZE"
  #   * "MALLOC_ALLOCATED_SIZE_CHECK"
  #   * "GC_PROFILE_DETAIL_MEMORY"
  # 
  # 例:
  # 
  #   GC::OPTS # => ["USE_RGENGC", "RGENGC_ESTIMATE_OLDMALLOC", "GC_ENABLE_LAZY_SWEEP"]
  #   # この場合、GCデバッグ機能やプロファイル機能は無効化されている
  def OPTS; end

end
