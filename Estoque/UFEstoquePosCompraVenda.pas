unit UFEstoquePosCompraVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask, Grids, DBGrids, Db, ExtCtrls, DBCtrls, ComCtrls;

type
  TFEstoquePCompraVenda = class(TForm)
    Lbl_Produto: TLabel;
    MeCodProduto: TMaskEdit;
    SBProdutoCons: TSpeedButton;
    MeProduto: TMaskEdit;
    Btn_ContratosVencidosAVencer: TBitBtn;
    GroupBox1: TGroupBox;
    Lbl_DataI: TLabel;
    Lbl_DataF: TLabel;
    ListView1: TListView;
    MeData_I: TMaskEdit;
    MeData_F: TMaskEdit;
    procedure SBProdutoConsClick(Sender: TObject);
    procedure MeCodProdutoExit(Sender: TObject);
    procedure Btn_ContratosVencidosAVencerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function NumToTexto(wNum:Real;wDec,wTamanho:Byte):String;
  public
    { Public declarations }
  end;

var
  FEstoquePCompraVenda: TFEstoquePCompraVenda;

implementation

uses UEstoque_cl, UProdutoCons, UProduto_cl, UOracle_cl,
  UConsulta_Resultado;

{$R *.DFM}

procedure TFEstoquePCompraVenda.SBProdutoConsClick(Sender: TObject);
begin
  if FProdutoCons=nil then
     FProdutoCons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk then
  begin
      MECodProduto.Text:=FloatToStr(DMProduto.QProdutoConsCod_Produto.Value);
      MEProduto.Text:=DMProduto.QProdutoConsDesc_Produto.Value;
  end;
end;

procedure TFEstoquePCompraVenda.MeCodProdutoExit(Sender: TObject);
var wCodProduto : String;
begin
  if Trim(FEstoquePCompraVenda.MeCodProduto.Text) = '' then
     raise exception.Create('Código do produto não pode ficar em branco!')
  else
  begin
    wCodProduto := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',' COD_PRODUTO ='+MECodProduto.Text);
    if Trim(wCodProduto) = '' then
    begin
       MeCodProduto.SetFocus;
       raise exception.Create('Produto não encontrado!');
    end
    else
       MeProduto.Text := wCodProduto;
  end;
end;

procedure TFEstoquePCompraVenda.Btn_ContratosVencidosAVencerClick(
  Sender: TObject);
var
  mTotalContratoAberto, mTotalContratoFechado       : Real;
  mTotalAEmbarcar     , mTotalDepositoOutrasEmpresas: Real;
  mTotalDepositoNaEmpresa                           : Real;
  mTotalSaldoaFixar , mTotalEstoqueAtual,mSaldoFinal: Real;
  ListItem1                                         : TListItem;
  mTitulo                                           : String;
begin
  if Trim(FEstoquePCompraVenda.MeCodProduto.Text) = '' then
     raise exception.Create('É necessario informar código do produto!');
  DMEstoque.QPContratoAberto.Close;
  DMEstoque.QPContratoAberto.SetVariable('PK',FEstoquePCompraVenda.MeCodProduto.Text);
  DMEstoque.QPContratoAberto.SetVariable('DT_VENCIMENTO_I',FEstoquePCompraVenda.MeData_I.Text);
  DMEstoque.QPContratoAberto.SetVariable('DT_VENCIMENTO_F',FEstoquePCompraVenda.MeData_F.Text);
  DMEstoque.QPContratoAberto.Open;

  mTotalContratoAberto := 0;  // Inicializa valor da variavel.

  with ListView1 do
  begin
    ListView1.Items.Clear;
    ListView1.Refresh;
    DMEstoque.QPContratoAberto.First;
    mTitulo := 'S';
    while not DMEstoque.QPContratoAberto.Eof do
    begin
      if mTitulo = 'S' then
      begin
        ListItem1 := Items.Add;
        ListItem1.Caption := '***';
        ListItem1.SubItems.Add('C O N T R A T O S   E M   A B E R T O');
        ListItem1.SubItems.Add('            ***');
        mTitulo := 'N';
        ListItem1 := Items.Add;
      end;

      ListItem1 := Items.Add;
      ListItem1.Caption := Trim(DMEstoque.QPContratoAbertoCOD_FILIAL.Text);
      ListItem1.SubItems.Add(DMEstoque.QPContratoAbertoDESC_FILIAL.Value);
      ListItem1.SubItems.Add(NumToTexto(DMEstoque.QPContratoAbertoSALDO.Value,0,11));
      mTotalContratoAberto := mTotalContratoAberto + DMEstoque.QPContratoAbertoSALDO.Value;
      DMEstoque.QPContratoAberto.Next;
    end;
    If mTotalContratoAberto <> 0 Then
     Begin
      ListItem1 := Items.Add;
      ListItem1.SubItems.Add('T o t a l');
      ListItem1.SubItems.Add(NumToTexto(mTotalContratoAberto,0,11));
     End;

    // ------------------------------ Contratos fechados ----------------------\\
    DMEstoque.QPContratoFechado.Close;
    DMEstoque.QPContratoFechado.SetVariable('PK',FEstoquePCompraVenda.MeCodProduto.Text);
    DMEstoque.QPContratoFechado.SetVariable('DT_VENCIMENTO_I',FEstoquePCompraVenda.MeData_I.Text);
    DMEstoque.QPContratoFechado.SetVariable('DT_VENCIMENTO_F',FEstoquePCompraVenda.MeData_F.Text);
    DMEstoque.QPContratoFechado.Open;
    DMEstoque.QPContratoFechado.First;

    mTotalContratoFechado := 0;  // Inicializa valor da variavel.

    mTitulo := 'S';
    while not DMEstoque.QPContratoFechado.Eof do
    begin
      if mTitulo = 'S' then
      begin
        ListItem1 := Items.Add;
        ListItem1 := Items.Add;
        ListItem1.Caption := '***';
        ListItem1.SubItems.Add('C O N T R A T O S    F E C H A D O S');
        ListItem1.SubItems.Add('            ***');
        mTitulo := 'N';
//        ListItem1 := Items.Add;
      end;

      ListItem1 := Items.Add;
      ListItem1.Caption := Trim(DMEstoque.QPContratoFechadoCOD_FILIAL.Text);
      ListItem1.SubItems.Add(DMEstoque.QPContratoFechadoDESC_FILIAL.Value);
      ListItem1.SubItems.Add(NumToTexto(DMEstoque.QPContratoFechadoSALDO.Value,0,11));
      mTotalContratoFechado := mTotalContratoFechado + DMEstoque.QPContratoFechadoSALDO.Value;

      DMEstoque.QPContratoFechado.Next;

    end;
    If mTotalContratoFechado <> 0 Then
    Begin
      ListItem1 := Items.Add;
      ListItem1.SubItems.Add('T o t a l');
      ListItem1.SubItems.Add(NumToTexto(mTotalContratoFechado,0,11));
    End;
    // --------------------  A Embarcar ---------------------\\
    DMEstoque.QEstoque_Posicao_Emb.Close;
    DMEstoque.QEstoque_Posicao_Emb.SetVariable('COD_PRODUTO',MeCodProduto.Text);
    DMEstoque.QEstoque_Posicao_Emb.Open;
    DMEstoque.QEstoque_Posicao_Emb.First;

    mTotalAEmbarcar := 0; // Inicializa valor da variavel;

    mTitulo := 'S';
    while not DMEstoque.QEstoque_Posicao_Emb.Eof do
    begin
      if mTitulo = 'S' then
      begin
        ListItem1 := Items.Add;
        ListItem1 := Items.Add;
        ListItem1.Caption := '***';
        ListItem1.SubItems.Add('E S T O Q U E   A   E M B A R C A R');
        ListItem1.SubItems.Add('            ***');
        mTitulo := 'N';
//        ListItem1 := Items.Add;
      end;

      ListItem1 := Items.Add;
      ListItem1.Caption := Trim(DMEstoque.QEstoque_Posicao_EmbCOD_FILIAL.Text);
      ListItem1.SubItems.Add(DMEstoque.QEstoque_Posicao_EmbDESC_FILIAL.Value);
      ListItem1.SubItems.Add(NumToTexto(DMEstoque.QEstoque_Posicao_EmbSQT_SALDO_EMB.Value,0,11));
      mTotalAEmbarcar := mTotalAEmbarcar + DMEstoque.QEstoque_Posicao_EmbSQT_SALDO_EMB.Value;

      DMEstoque.QEstoque_Posicao_Emb.Next;

    end;
    If mTotalAEmbarcar <> 0 Then
     Begin
      ListItem1 := Items.Add;
      ListItem1.SubItems.Add('T o t a l');
      ListItem1.SubItems.Add(NumToTexto(mTotalAEmbarcar,0,11));
     End;

    // Abre SQL para buscar valor de estoque na Empresa e em outras empresas //
    DMEstoque.QEstoqueOEmpresa.Close;
    DMEstoque.QEstoqueOEmpresa.SetVariable('COD_PRODUTO',MeCodProduto.Text);
    DMEstoque.QEstoqueOEmpresa.SetVariable('DATAI',MEData_I.Text);
    DMEstoque.QEstoqueOEmpresa.SetVariable('DATAF',MEData_F.Text);
    DMEstoque.QEstoqueOEmpresa.Open;

    // -----------------------  Deposito na empresas ------------------------\\
    DMEstoque.QEstoqueOEmpresa.First;
    mTitulo := 'S';

    mTotalDepositoNaEmpresa := 0; // Inicializa valor para variavel.

    while not DMEstoque.QEstoqueOEmpresa.Eof do
    begin
      if mTitulo = 'S' then
      begin
        ListItem1 := Items.Add;
        ListItem1 := Items.Add;
        ListItem1.Caption := '***';
        ListItem1.SubItems.Add('D E P O S I T O   N A   E M P R E S A');
        ListItem1.SubItems.Add('            ***');
        mTitulo := 'N';
      end;
      if DMEstoque.QEstoqueOEmpresaSOMA_EMP.Value <> 0.0 then
      begin
        ListItem1 := Items.Add;
        ListItem1.Caption := Trim(DMEstoque.QEstoqueOEmpresaCOD_FILIAL.Text);
        ListItem1.SubItems.Add(DMEstoque.QEstoqueOEmpresaDESC_FILIAL.Value);
        ListItem1.SubItems.Add(NumToTexto(DMEstoque.QEstoqueOEmpresaSOMA_EMP.Value,0,11));
        mTotalDepositoNaEmpresa := mTotalDepositoNaEmpresa + DMEstoque.QEstoqueOEmpresaSOMA_EMP.Value;
      end;
      DMEstoque.QEstoqueOEmpresa.Next;
    end;
    If mTotalDepositoNaEmpresa <> 0 Then
    begin
      ListItem1 := Items.Add;
      ListItem1.SubItems.Add('T o t a l');
      ListItem1.SubItems.Add(NumToTexto(mTotalDepositoNaEmpresa,0,11));
    end;
    // ------------------  Deposito em outras empresas ---------------------\\
    DMEstoque.QEstoqueOEmpresa.First;
    mTitulo := 'S';

    mTotalDepositoOutrasEmpresas := 0; // Inicializa valor para variavel.
    while not DMEstoque.QEstoqueOEmpresa.Eof do
    begin
      if mTitulo = 'S' then
      begin
        ListItem1 := Items.Add;
        ListItem1 := Items.Add;
        ListItem1.Caption := '***';
        ListItem1.SubItems.Add('D E P O S I T O   E M   O U T R A S   E M P R E S A S');
        ListItem1.SubItems.Add('            ***');
        mTitulo := 'N';
//        ListItem1 := Items.Add;
      end;
      if DMEstoque.QEstoqueOEmpresaSOMA.Value <> 0.0 then
      begin
        ListItem1 := Items.Add;
        ListItem1.Caption := Trim(DMEstoque.QEstoqueOEmpresaCOD_FILIAL.Text);
        ListItem1.SubItems.Add(DMEstoque.QEstoqueOEmpresaDESC_FILIAL.Value);
        ListItem1.SubItems.Add(NumToTexto(DMEstoque.QEstoqueOEmpresaSOMA.Value,0,11));
        mTotalDepositoOutrasEmpresas := mTotalDepositoOutrasEmpresas + DMEstoque.QEstoqueOEmpresaSOMA.Value;
      end;
      DMEstoque.QEstoqueOEmpresa.Next;
    end;
    If mTotalDepositoOutrasEmpresas <> 0 Then
    Begin
      ListItem1 := Items.Add;
      ListItem1.SubItems.Add('T o t a l');
      ListItem1.SubItems.Add(NumToTexto(mTotalDepositoOutrasEmpresas,0,11));
    End;
    // --------------------  Saldo a fixar ---------------------\\
    DMEstoque.QEstoque_PosicaoFixar.Close;
    DMEstoque.QEstoque_PosicaoFixar.SetVariable('PRODUTO',MeCodProduto.Text);
    DMEstoque.QEstoque_PosicaoFixar.SetVariable('DATAI',MEData_I.Text);
    DMEstoque.QEstoque_PosicaoFixar.SetVariable('DATAF',MEData_F.Text);
    DMEstoque.QEstoque_PosicaoFixar.Open;
    DMEstoque.QEstoque_PosicaoFixar.First;
    mTitulo := 'S';

    mTotalSaldoaFixar := 0; // Inicializa valor da variavel.

    while not DMEstoque.QEstoque_PosicaoFixar.Eof do
    begin
      if mTitulo = 'S' then
      begin
        ListItem1 := Items.Add;
        ListItem1 := Items.Add;
        ListItem1.Caption := '***';
        ListItem1.SubItems.Add('S A L D O   A   F I X A R');
        ListItem1.SubItems.Add('            ***');
        mTitulo := 'N';
//        ListItem1 := Items.Add;
      end;

      ListItem1 := Items.Add;
      ListItem1.Caption :=Trim(DMEstoque.QEstoque_PosicaoFixarCOD_FILIAL.Text);
      ListItem1.SubItems.Add(DMEstoque.QEstoque_PosicaoFixarDESC_FILIAL.Value);
      ListItem1.SubItems.Add(NumToTexto(DMEstoque.QEstoque_PosicaoFixarSQUANTIDADE_FIXAR.Value,0,11));
//      DMEstoque.QEstoque_PosicaoFixarSQUANTIDADE_FIXAR.Value;
      mTotalSaldoaFixar := mTotalSaldoaFixar + DMEstoque.QEstoque_PosicaoFixarSQUANTIDADE_FIXAR.Value;
      DMEstoque.QEstoque_PosicaoFixar.Next;
    end;
    If mTotalSaldoaFixar <> 0 Then
     Begin
      ListItem1 := Items.Add;
      ListItem1.SubItems.Add('T o t a l');
      ListItem1.SubItems.Add(NumToTexto(mTotalSaldoaFixar,0,11));
     End;
    // --------------------  Quantidade em estoque ---------------------\\
    DMEstoque.QEstoquePosicao.Close;
    DMEstoque.QEstoquePosicao.SetVariable('PRODUTO',MeCodProduto.Text);
    DMEstoque.QEstoquePosicao.Open;
    DMEstoque.QEstoquePosicao.First;

    mTotalEstoqueAtual := 0; // Inicializa valor da variavel.

    mTitulo := 'S';
    while not DMEstoque.QEstoquePosicao.Eof do
    begin
      if mTitulo = 'S' then
      begin
        ListItem1 := Items.Add;
        ListItem1 := Items.Add;
        ListItem1.Caption := '***';
        ListItem1.SubItems.Add('Q U A N T I D A D E   A T U A L   N O   E S T O Q U E');
        ListItem1.SubItems.Add('            ***');
        mTitulo := 'N';
//        ListItem1 := Items.Add;
      end;

      ListItem1 := Items.Add;
      ListItem1.Caption := Trim(DMEstoque.QEstoquePosicaoCOD_FILIAL.Text);
      ListItem1.SubItems.Add(DMEstoque.QEstoquePosicaoDESC_FILIAL.Value);
      ListItem1.SubItems.Add(NumToTexto(DMEstoque.QEstoquePosicaoQUANTIDADE.Value,0,11));
      mTotalEstoqueAtual := mTotalEstoqueAtual + DMEstoque.QEstoquePosicaoQUANTIDADE.Value;

      DMEstoque.QEstoquePosicao.Next;
    end;
    If mTotalEstoqueAtual <> 0 Then
     Begin
      ListItem1 := Items.Add;
      ListItem1.SubItems.Add('T o t a l');
      ListItem1.SubItems.Add(NumToTexto(mTotalEstoqueAtual,0,11));
     End;
    //------------------------------- Saldo final -----------------------\\

    mSaldoFinal := 0;  // Inicializa valor da variavel;

    mSaldoFinal := mSaldoFinal + mTotalContratoAberto;
    mSaldoFinal := mSaldoFinal - mTotalContratoFechado;
    mSaldoFinal := mSaldoFinal - mTotalAEmbarcar;
    mSaldoFinal := mSaldoFinal + mTotalDepositoNaEmpresa;
    mSaldoFinal := mSaldoFinal + mTotalDepositoOutrasEmpresas;
    mSaldoFinal := mSaldoFinal + mTotalEstoqueAtual;
    ListItem1 := Items.Add;
    ListItem1 := Items.Add;
    ListItem1.SubItems.Add('Total dos Contratos em Aberto');
    ListItem1.SubItems.Add(NumToTexto(mTotalContratoAberto,0,11));
    ListItem1 := Items.Add;
    ListItem1.SubItems.Add('Total dos Contratos Fechados');
    ListItem1.SubItems.Add(NumToTexto(mTotalContratoFechado,0,11));
    ListItem1 := Items.Add;
    ListItem1.SubItems.Add('Total do Saldo a Embarcar');
    ListItem1.SubItems.Add(NumToTexto(mTotalAEmbarcar,0,11));
    ListItem1 := Items.Add;
    ListItem1.SubItems.Add('Total do Saldo a Fixar');
    ListItem1.SubItems.Add(NumToTexto(mTotalSaldoaFixar,0,11));
    ListItem1 := Items.Add;
    ListItem1.SubItems.Add('Total de Depósitos na Empresa');
    ListItem1.SubItems.Add(NumToTexto(mTotalDepositoNaEmpresa,0,11));
    ListItem1 := Items.Add;
    ListItem1.SubItems.Add('Total de Depósitos em Outras Empresas');
    ListItem1.SubItems.Add(NumToTexto(mTotalDepositoOutrasEmpresas,0,11));
    ListItem1 := Items.Add;
    ListItem1.SubItems.Add('Quantidade Total do Estoque');
    ListItem1.SubItems.Add(NumToTexto(mTotalEstoqueAtual,0,11));
    ListItem1 := Items.Add;
    ListItem1.SubItems.Add('S a l d o   F i n a l -------> ');
    ListItem1.SubItems.Add(NumToTexto(mSaldoFinal,0,11));
  end;
end;

procedure TFEstoquePCompraVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
  FEstoquePCompraVenda := Nil;
end;

function TFEstoquePCompraVenda.NumToTexto(wNum:Real;wDec,wTamanho:Byte):String;
Var wFormato, wAux : String;
     Const wBranco : String = '                                                                                                                                                                           ';

begin
  wFormato := '###,###,##0';
  If wDec > 0 Then
    wFormato := wFormato+'.'+Copy('0000000',1,wDec);
  wAux := FormatFloat(wFormato,wNum);
  Result := Copy(wBranco,1,wTamanho-Length(wAux))+wAux;
end;

end.

