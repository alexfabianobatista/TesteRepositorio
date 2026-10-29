unit UAtualizaEstoque_Custo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db;

type
  TFOFI0002 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    EdNumFabricante: TEdit;
    EdProdutoDesc: TEdit;
    Label2: TLabel;
    EdCustoMedio: TEdit;
    Label3: TLabel;
    EdUltimoCusto: TEdit;
    Label4: TLabel;
    EdEstoqueAtual: TEdit;
    Label5: TLabel;
    EdPrecoVendaVarejo: TEdit;
    BtnConfirmaEstoque: TBitBtn;
    DSAtualizaEstoque_Custo: TDataSource;
    Label6: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    SBFilialCons: TSpeedButton;
    SBProdutoCons: TSpeedButton;
    BtnConfirmaPreco: TBitBtn;
    Memo1: TMemo;
    CheckBox1: TCheckBox;
    Label7: TLabel;
    EdUltimaCompra: TEdit;
    procedure SBFilialConsClick(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure BtnConfirmaEstoqueClick(Sender: TObject);
    procedure BtnConfirmaPrecoClick(Sender: TObject);
    procedure SBProdutoConsClick(Sender: TObject);
    procedure EdNumFabricanteExit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure EdUltimoCustoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOFI0002: TFOFI0002;

implementation

uses UOficina_cl, UOracle_cl, UFilialCons, UFilial_cl, UProduto_cl,
  UProdutoCons, UUsuario_cl, DateUtils, StrUtils, UBiblioteca;

{$R *.DFM}

procedure TFOFI0002.SBFilialConsClick(Sender: TObject);
begin
  if FFilialCons = nil then
     FFilialCons:= TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
     Edit5.Text:= FloatToStr(DMFilial.QFilialConsCOD_FILIAL.Value);   
end;

procedure TFOFI0002.Edit5Change(Sender: TObject);
begin
  if Trim(Edit5.Text) <> '' then
     Edit6.Text:= DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Edit5.Text)
  else
     Edit6.Text:= '';
end;

procedure TFOFI0002.BtnConfirmaEstoqueClick(Sender: TObject);
var
  mCodProduto: String;
  wCusto, wEstoque: Boolean;
  wQtAnterior: Real;
begin
  if (trim(EdCustoMedio.text) = '') and (trim(EdUltimoCusto.text) = '') then
    raise exception.create('Valor custo deve ser informados');
    
  if not DMOficina.SenhaLiberaCadastro then
    raise exception.create('Senha não confere')
  else
  begin
    if (Trim(Edit5.Text) = '') or (Trim(EdNumFabricante.Text) = '') then
      raise exception.Create('Número de fabricante e/ou Filial devem ser informados!');

    mCodProduto:= DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+CHR(39)+EdNumFabricante.Text+CHR(39));
    if Trim(mCodProduto) = '' then
       raise exception.Create('Produto não encontrado no cadastro!!! Verifique!');

    with DMOficina do
    begin
      wCusto := False;
      wEstoque := False;
      Try
        QAtzEstoque_CustoViaOficina.Close;
        QAtzEstoque_CustoViaOficina.SetVariable('COD_FILIAL',Edit5.Text);
        QAtzEstoque_CustoViaOficina.SetVariable('COD_PRODUTO',mCodProduto);
        QAtzEstoque_CustoViaOficina.Open;
        if QAtzEstoque_CustoViaOficina.Eof then
        begin
          QAtzEstoque_CustoViaOficina.Insert;
          QAtzEstoque_CustoViaOficinaCOD_PRODUTO.Value  := StrToFloat(mCodProduto);
          QAtzEstoque_CustoViaOficinaCOD_LOTE_TIPO.Value:= 1;
          if Trim(Edit5.Text) = '' then
            Edit5.Text := '1';
          QAtzEstoque_CustoViaOficinaCOD_FILIAL.Value:= StrToInt(Trim(Edit5.Text));
          QAtzEstoque_CustoViaOficinaDT_COMPRA.Value := DMOracle.DataServ;
        end
        else
          QAtzEstoque_CustoViaOficina.Edit;

        if (Trim(EdUltimoCusto.Text) <> '') and (Trim(EdEstoqueAtual.Text) <> '') then
        begin
          QAtzEstoque_CustoViaOficinaVL_CUSTO_MEDIO.Value := StrToFloat(EdCustoMedio.Text);
          QAtzEstoque_CustoViaOficinaVL_ULTIMO_CUSTO.Value:= StrToFloat(EdUltimoCusto.Text);
          wQtAnterior := QAtzEstoque_CustoViaOficinaQT_QUANTIDADE.Value;
          QAtzEstoque_CustoViaOficinaQT_QUANTIDADE.Value  := StrToFloat(EdEstoqueAtual.Text);
          wCusto := QAtzEstoque_CustoViaOficinaVL_ULTIMO_CUSTO.OldValue <>
              QAtzEstoque_CustoViaOficinaVL_ULTIMO_CUSTO.Value;
          wEstoque := QAtzEstoque_CustoViaOficinaQT_QUANTIDADE.OldValue <>
              QAtzEstoque_CustoViaOficinaQT_QUANTIDADE.Value;

          if CheckBox1.Checked = True then
          begin
            if Trim(EdEstoqueAtual.Text) <> '' then
            begin
              QAtzEstoque_CustoViaOficinaQT_INVENTARIO.Value := StrToFloat(EdEstoqueAtual.Text);
              QAtzEstoque_CustoViaOficinaDT_INVENTARIO.Value := Date;
            end;
          end;
          QAtzEstoque_CustoViaOficina.Post;
        end
        else
          raise exception.Create('O custo e o estoque atual não foram atualizados pois um deles esta em branco');
      except
        QAtzEstoque_CustoViaOficina.Cancel;
        raise;
      end;
        //dados pra relatorio de alteraçoes no estoque
        QControleEstoque.Close;
        QControleEstoque.Open;
        QControleEstoque.Insert;
        if Edit5.Text = '' then
          bib.GravaLogEventosWindows('PjOficina', 'Atualiza Estoque - Filial não informada', 'informacao');
        if mCodProduto = '' then
          bib.GravaLogEventosWindows('PjOficina', 'Atualiza Estoque - Produto não informado', 'informacao');
        if EdEstoqueAtual.Text = '' then
          bib.GravaLogEventosWindows('PjOficina', 'Atualiza Estoque - Estoque atual não informado', 'informacao');
        if wQtAnterior = 0 then
          bib.GravaLogEventosWindows('PjOficina', 'Atualiza Estoque - Quantidade anterior não encontrado', 'informacao');
        if DMOracle.DataServ = 0 then
          bib.GravaLogEventosWindows('PjOficina', 'Atualiza Estoque - Data de alteração não informada', 'informacao');
        if DMUsuario.CodUsuarioCorrente = 0 then
          bib.GravaLogEventosWindows('PjOficina', 'Atualiza Estoque - Codigo de usuario não informado', 'informacao');
        if EdUltimoCusto.Text = '' then
          bib.GravaLogEventosWindows('PjOficina', 'Atualiza Estoque - Ultimo custo não informado', 'informacao');

        QControleEstoqueCOD_FILIAL.Value := StrToInt(Trim(Edit5.Text));
        QControleEstoqueCOD_PRODUTO.Value := StrToInt(mCodProduto);
        QControleEstoqueQT_QUANTIDADE.Value := StrToInt(Trim(EdEstoqueAtual.Text));
        QControleEstoqueQT_QUANTIDADE_ANTERIOR.value := wQtAnterior;
        QControleEstoqueDT_ALTERACAO.Value := DMOracle.DataServ;
        QControleEstoqueCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
        QControleEstoqueVAL_CUSTO.Value := StrToFloat(Trim(EdUltimoCusto.Text));
        QControleEstoqueIND_CUSTO.Value := IfThen(wCusto, 'S', 'N');
        QControleEstoqueIND_ESTOQUE.Value := IfThen(wEstoque, 'S', 'N');
        QControleEstoque.Post;
        QControleEstoque.Close;
    end;
    EdNumFabricante.Text   := '';
    EdCustoMedio.Text      := '';
    EdUltimoCusto.Text     := '';
    EdEstoqueAtual.Text    := '';
    EdPrecoVendaVarejo.Text:= '';
  end;
end;

procedure TFOFI0002.BtnConfirmaPrecoClick(Sender: TObject);
begin
  //if DMOficina.SenhaLiberaCadastro = false then   Raquel pediu para tirar. Vanessa 18/01/2017
  //     raise exception.create('Senha não confere')
  //else
  //begin
    if Trim(EdNumFabricante.Text) = '' then
       raise exception.Create('Informe número fabricante!');

    if Trim(EdPrecoVendaVarejo.Text) = '' then
       raise exception.create('Preço de venda deve ser informado!');

    with DmOficina do
    begin
      Try
        QAtualizaPrecoVarejo.Close;
        QAtualizaPrecoVarejo.SetVariable('NUM_FABRICANTE',EdNumFabricante.Text);
        QAtualizaPrecoVarejo.Open;
        if QAtualizaPrecoVarejo.RecordCount > 0 then
        begin
          QAtualizaPrecoVarejo.Edit;
          QAtualizaPrecoVarejoVAL_VAREJO.Value:= StrToFloat(EdPrecoVendaVarejo.Text);
          QAtualizaPrecoVarejoDT_ALTERACAO_PRECO.Value:= DMOracle.DataServ;
          QAtualizaPrecoVarejo.Post;
        end
        else
           MessageDlg('Não foi encontrado movimentação no estoque/Atualização cancelada!',mtInformation,[mbOk],0);
      Except
        raise exception.Create('Erro ao tentar atualizar preço venda produto!');
      end;
      QAtualizaPrecoVarejo.Close;
      EdNumFabricante.Text   := '';
      EdCustoMedio.Text      := '';
      EdUltimoCusto.Text     := '';
      EdEstoqueAtual.Text    := '';
      EdPrecoVendaVarejo.Text:= '';
    end;
  //end;
end;

procedure TFOFI0002.SBProdutoConsClick(Sender: TObject);
begin
  if FProdutoCons = nil then
     FProdutoCons:= TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
     EdNumFabricante.Text:= DMProduto.QProdutoConsNUM_FABRICANTE.Value;
end;

procedure TFOFI0002.EdNumFabricanteExit(Sender: TObject);
begin
  if Trim(EdNumFabricante.Text) <> '' then
     EdProdutoDesc.Text:= DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+CHR(39)+EdNumFabricante.Text+CHR(39))
  else
  begin
    EdNumFabricante.Text   := '';
    EdCustoMedio.Text      := '';
    EdUltimoCusto.Text     := '';
    EdEstoqueAtual.Text    := '';
    EdPrecoVendaVarejo.Text:= '';
  end;

  if Trim(EdProdutoDesc.Text) <> '' then
  begin
    with DMOficina do
    begin
      QOSEstoqueAtual.Close;
      if Trim(Edit5.Text) = '' then
         Edit5.Text := '1';
      QOSEstoqueAtual.SetVariable('COD_FILIAL',Edit5.Text);
      QOSEstoqueAtual.SetVariable('NUM_FABRICANTE',EdNumFabricante.Text);
      QOSEstoqueAtual.Open;
      EdCustoMedio.Text  := FloatToStr(QOSEstoqueAtualVL_CUSTO_MEDIO.Value);
      EdUltimoCusto.Text := FloatToStr(QOSEstoqueAtualVL_ULTIMO_CUSTO.Value);
      EdEstoqueAtual.Text:= FloatToStr(QOSEstoqueAtualQT_QUANTIDADE.Value);
      EdPrecoVendaVarejo.Text:= FloatToStr(QOSEstoqueAtualVAL_VAREJO.Value);
      EdUltimaCompra.Text := QOSEstoqueAtualDT_COMPRA.Text;
    end;
  end;
end;

procedure TFOFI0002.Edit5Exit(Sender: TObject);
begin
  EdNumFabricanteExit(self);
end;

procedure TFOFI0002.EdUltimoCustoChange(Sender: TObject);
begin
     EdCustoMedio.Text:=EdUltimoCusto.Text;
end;

end.
