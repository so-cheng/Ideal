namespace Ideal.Ideal.Common.Enums
{
    public enum DbFieldMode
    {
        /// <summary>
        /// 任意时刻全部保存
        /// </summary>
        ALL_SAVE = 1,
        /// <summary>
        /// 仅insert时保存
        /// </summary>
        ONLY_INSERT = 2,
        /// <summary>
        /// 仅update时保存
        /// </summary>
        ONLY_UPDATE = 3,
        /// <summary>
        /// 从不保存
        /// </summary>
        NEVER_SAVE = 4,
        /// <summary>
        /// 主键
        /// </summary>
        PRIMARY_KEY = 5,
    }
}