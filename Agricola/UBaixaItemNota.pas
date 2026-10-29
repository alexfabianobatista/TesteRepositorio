unit UBaixaItemNota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, Grids, DBGrids, DBCtrls, Mask, variants,
  UFmCadastro, ExtCtrls;

type
  TFBaixaItemNota = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DSContratoVend_Nota: TDataSource;
    DSContratoVendCons: TDataSource;
    DSTotalNotaItem: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    MEBaixa: TMaskEdit;
    Button1: TButton;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    GroupBox9: TGroupBox;
    ME_DataI: TMaskEdit;
    ME_DataF: TMaskEdit;
    BitBtn3: TBitBtn;
    Label5: TLabel;
    MeProduto: TMaskEdit;
    BitBtn4: TBitBtn;
    EdProduto: TEdit;
    Label6: TLabel;
    MeFilial: TMaskEdit;
    BtFilial: TBitBtn;
    FmCadastroParceiro: TFmCadastro;
    RgOrdem: TRadioGroup;
    BitBtn5: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure MeProdutoExit(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBaixaItemNota: TFBaixaItemNota;

implementation

uses Ucontrato_cl, UOracle_cl, UUsuario_cl, UProdutoCons, UProduto_cl,
  UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFBaixaItemNota.BitBtn1Click(Sender: TObject);
begin
  DMOracle.DBCemapa.Commit;
end;

procedure TFBaixaItemNota.BitBtn2Click(Sender: TObject);
begin
  DMOracle.DBCemapa.Rollback;
end;

procedure TFBaixaItemNota.Button1Click(Sender: TObject);
var
 Qtde, QtdeBaixar:Real;
begin
  DMContrato.QContrato_Vend.Close;
  DMContrato.QContrato_Vend.SetVariable('PK',DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value);
  DMContrato.QContrato_Vend.Open;
  DMContrato.QContrato_VendMov.Close;
  DMContrato.QContrato_VendMov.Open;
  if Trim(MEBaixa.Text)<>'' then
    begin
      Qtde:=StrToFloat(MEBaixa.text);
      if (Qtde <= DMContrato.QTotalNotaItemsaldo_disponivel.Value) and (DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value>0) then
        begin
          if Qtde >= DMContrato.QContrato_VendConsVAL_SALDO.Value then
            QtdeBaixar := DMContrato.QContrato_VendConsVAL_SALDO.Value
          else
            QtdeBaixar := Qtde;
          DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContratoVend_NotaCOD_FILIAL.Text),'AGRICOLA');
          Try
            DMContrato.QContrato_VendMov.Insert;
            DMContrato.QContrato_VendMovCOD_CONTRATO_VEND.Value:=DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value;
            DMContrato.QContrato_VendMovDATA.Value:=DMOracle.DataServ;
            DMContrato.QContrato_VendMovQT_QUANTIDADE.Value:=QtdeBaixar;
            If QtdeBaixar = 0 Then  // = a zero quando for uma nota de fixação de complemento de preço sem quantidade
              DMContrato.QContrato_VendMovVAL_MOVIMENTO.Value:=DMContrato.QContratoVend_NotaVAL_TOTAL.Value
            Else
              DMContrato.QContrato_VendMovVAL_MOVIMENTO.Value:=DMContrato.QContrato_VendMovQT_QUANTIDADE.Value*DMContrato.QContratoVend_NotaVAL_TOTAL.Value/DMContrato.QContratoVend_NotaQT_QUANTIDADE.Value;
            DMContrato.QContrato_VendMovDESC_OBSERVACAO.Value:='Gerado pela Nota de Fixação Nr.'+DMOracle.BuscaNome('SELECT NUM_NOTA FROM TB_NOTA_CAB','COD_NOTA_CAB = '+DMContrato.QContratoVend_NotaCOD_NOTA_CAB.text);
            DMContrato.QContrato_VendMovCOD_NOTA_ITEM.Value:=DMContrato.QContratoVend_NotaCOD_NOTA_ITEM.Value;
            DMContrato.QContrato_VendMov.Post;

            If QtdeBaixar <> 0 Then  // = a zero quando for uma nota de fixação de complemento de preço sem quantidade
            Begin
               DMContrato.QContrato_Vend.Edit;
               DMContrato.QContrato_VendVAL_SALDO.Value:=DMContrato.QContrato_VendVAL_SALDO.Value - QtdeBaixar;
               DMContrato.QContrato_Vend.Post;
            End;
            MEBaixa.Clear;
            if QtdeBaixar = DMContrato.QTotalNotaItemsaldo_disponivel.Value then
              begin
                DMContrato.QMudaStatusItemNF.Close;
                DMContrato.QMudaStatusItemNF.SetVariable('COD_NOTA_ITEM',DMContrato.QContratoVend_NotaCOD_NOTA_ITEM.Value);
                DMContrato.QMudaStatusItemNF.SetVariable('STATUS','S');
                DMContrato.QMudaStatusItemNF.ExecSQL;
              end;
            DMContrato.QContratoVend_Nota.Close;
            DMContrato.QContratoVend_Nota.SetVariable('DATA_INICIAL',ME_DataI.Text);
            DMContrato.QContratoVend_Nota.SetVariable('DATA_FINAL',ME_DataF.Text);
            DMContrato.QContratoVend_Nota.Open;
            DMContrato.QContrato_VendCons.Close;
            DMContrato.QContrato_VendCons.Open;
            DMContrato.QTotalNotaItem.Close;
            DMContrato.QTotalNotaItem.Open;
            DMContrato.QContrato_Vend.Close;
            DMContrato.QContrato_Vend.Open;
          except
            DMContrato.QContrato_VendMov.Cancel;
            DMContrato.QContrato_Vend.Cancel;
            Raise Exception.Create('Erro ao tentar incluir Movimento no contrato de venda');
          end;
        end
      else
        ShowMessage('Erro! A Qtde. da Baixa é superior ao valor do Item da Nota,'+#13+
                    'ou não existem Contratos de Venda disponíveis a serem baixados.');
    end;
end;

procedure TFBaixaItemNota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMContrato.QContrato_VendCons.Close;
  DMContrato.QTotalNotaItem.Close;
  DMContrato.QContratoVend_Nota.Close;
end;

procedure TFBaixaItemNota.BitBtn3Click(Sender: TObject);
var
  wClasse,wSubClasse,wCodClasse : Integer;
  wCodProduto : Real;
begin
  DMContrato.QContratoVend_Nota.Close;
  DMContrato.QContratoVend_Nota.SetVariable('COD_NOTA_CAB',Null);
  DMContrato.QContratoVend_Nota.SetVariable('DATA_INICIAL',ME_DataI.Text);
  DMContrato.QContratoVend_Nota.SetVariable('DATA_FINAL',ME_DataF.Text);
  If Trim(MeProduto.Text) <> '' Then
     DMContrato.QContratoVend_Nota.SetVariable('COD_PRODUTO',Trim(MeProduto.Text))
  Else
     DMContrato.QContratoVend_Nota.SetVariable('COD_PRODUTO',Null);
  If Trim(MeFilial.Text) <> '' Then
     DMContrato.QContratoVend_Nota.SetVariable('COD_FILIAL',Trim(MeFilial.Text))
  Else
     DMContrato.QContratoVend_Nota.SetVariable('COD_FILIAL',Null);
  If Trim(FmCadastroParceiro.MeCadastro.Text) <> '' Then
     DMContrato.QContratoVend_Nota.SetVariable('COD_CADASTRO_PARCEIRO',Trim(FmCadastroParceiro.MeCadastro.Text))
  Else
     DMContrato.QContratoVend_Nota.SetVariable('COD_CADASTRO_PARCEIRO',Null);
  DMContrato.QContratoVend_Nota.SQL[DMContrato.QContratoVend_Nota.SQL.Count-1] := '';
  Case RgOrdem.ItemIndex of
   0 : DMContrato.QContratoVend_Nota.SQL.Add('ORDER BY Tb_Nota_Cab.DT_EMISSAO');
   1 : DMContrato.QContratoVend_Nota.SQL.Add('ORDER BY Tb_nota_item.VAL_UNITARIO DESC');
   2 : DMContrato.QContratoVend_Nota.SQL.Add('ORDER BY Tb_nota_item.VAL_UNITARIO ');
   3 : DMContrato.QContratoVend_Nota.SQL.Add('ORDER BY Tb_nota_cab.COD_FILIAL, Tb_nota_item.VAL_UNITARIO DESC');
   4 : DMContrato.QContratoVend_Nota.SQL.Add('ORDER BY Tb_nota_cab.COD_FILIAL, Tb_nota_item.VAL_UNITARIO DESC');
   5 : DMContrato.QContratoVend_Nota.SQL.Add('ORDER BY Tb_nota_cab.DT_EMISSAO, Tb_nota_item.VAL_UNITARIO DESC');
   6 : DMContrato.QContratoVend_Nota.SQL.Add('ORDER BY Tb_nota_cab.DT_EMISSAO, Tb_nota_item.VAL_UNITARIO ');
  End;
  DMContrato.QContratoVend_Nota.Open;
  wCodProduto:=0;
  If DMContrato.QContratoVend_NotaCOD_NOTA_ITEM.Value > 0 then
    begin
      wCodProduto:=StrToFloat(DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_NOTA_ITEM','COD_NOTA_ITEM = '+FloatToStr(DMContrato.QContratoVend_NotaCOD_NOTA_ITEM.Value)));
      wCodClasse:=StrToInt(DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(wCodProduto)));
      wClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_CLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse)));
      wSubClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_SUBCLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse)));
    end;
  With DMContrato do
  Begin
    MontaSql(wClasse,wSubClasse,0,2,'','','','','','','',4);
    QTotalNotaItem.Close;
    QTotalNotaItem.Open;
  End;
end;

procedure TFBaixaItemNota.DBGrid1CellClick(Column: TColumn);
begin
  MeBaixa.Text := FloatToStr(DMContrato.QTotalNotaItemSaldo_Disponivel.Value);
end;

procedure TFBaixaItemNota.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  MeBaixa.Text := FloatToStr(DMContrato.QTotalNotaItemSaldo_Disponivel.Value);
end;

procedure TFBaixaItemNota.BitBtn4Click(Sender: TObject);
begin
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
  begin
     MeProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
     MeProdutoExit(Self);
  end;
end;

procedure TFBaixaItemNota.MeProdutoExit(Sender: TObject);
begin
  If Trim(MEProduto.Text) <> '' Then
     EdProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(MEProduto.text))
  Else
     EdProduto.Text := 'Todos';
end;

procedure TFBaixaItemNota.BtFilialClick(Sender: TObject);
begin
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
     MeFilial.Text := DMFilial.QFilialConsCod_Filial.Text;

end;

procedure TFBaixaItemNota.BitBtn5Click(Sender: TObject);
var
 Qtde, QtdeBaixar,wSaldo_Contrato:Real;
begin
  if DMContrato.QContrato_VendCons.Eof then
     Raise Exception.Create('Selecionar um Contrato de Venda');
  If Trim(MeProduto.Text) = '' Then
     Raise Exception.Create('Informar código produto para baixa automatica');
  DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContratoVend_NotaCOD_FILIAL.Text),'AGRICOLA');
  DMContrato.QContrato_Vend.Close;
  DMContrato.QContrato_Vend.SetVariable('PK',DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value);
  DMContrato.QContrato_Vend.Open;
  DMContrato.QContrato_VendMov.Close;
  DMContrato.QContrato_VendMov.Open;
  wSaldo_Contrato := DMContrato.QContrato_VendConsVAL_SALDO.Value;  // saldo do contrato até onde poderá ser baixado
  DMContrato.pBaixa_Automatica := True;
  While Not(DMContrato.QContratoVend_Nota.Eof) And (wSaldo_Contrato > 0) Do // ate nao for final das notas e o contrato tiver saldo
   Begin
      Qtde:=DMContrato.QTotalNotaItemSaldo_disponivel.Value;
      if Qtde >= wSaldo_Contrato then
       Begin
         QtdeBaixar := wSaldo_Contrato;
         wSaldo_Contrato := 0; // zerou o saldo do contrato para baixar
       End
      else
       Begin
         QtdeBaixar := Qtde;
         wSaldo_Contrato := wSaldo_Contrato - QtdeBaixar;
       End;
      Try
        DMContrato.QContrato_VendMov.Insert;
        DMContrato.QContrato_VendMovCOD_CONTRATO_VEND.Value:=DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value;
        DMContrato.QContrato_VendMovDATA.Value:=DMOracle.DataServ;
        DMContrato.QContrato_VendMovQT_QUANTIDADE.Value:=QtdeBaixar;
        If QtdeBaixar = 0 Then  // = a zero quando for uma nota de fixação de complemento de preço sem quantidade
           DMContrato.QContrato_VendMovVAL_MOVIMENTO.Value:=DMContrato.QContratoVend_NotaVAL_TOTAL.Value
        Else
           DMContrato.QContrato_VendMovVAL_MOVIMENTO.Value:=DMContrato.QContrato_VendMovQT_QUANTIDADE.Value*DMContrato.QContratoVend_NotaVAL_TOTAL.Value/DMContrato.QContratoVend_NotaQT_QUANTIDADE.Value;
        DMContrato.QContrato_VendMovDESC_OBSERVACAO.Value:='Gerado pela Nota de Fixação Nr.'+DMOracle.BuscaNome('SELECT NUM_NOTA FROM TB_NOTA_CAB','COD_NOTA_CAB = '+DMContrato.QContratoVend_NotaCOD_NOTA_CAB.text);
        DMContrato.QContrato_VendMovCOD_NOTA_ITEM.Value:=DMContrato.QContratoVend_NotaCOD_NOTA_ITEM.Value;
        DMContrato.QContrato_VendMov.Post;

        If QtdeBaixar <> 0 Then  // = a zero quando for uma nota de fixação de complemento de preço sem quantidade
         Begin
           DMContrato.QContrato_Vend.Edit;
           DMContrato.QContrato_VendVAL_SALDO.Value:=DMContrato.QContrato_VendVAL_SALDO.Value - QtdeBaixar;
           DMContrato.QContrato_Vend.Post;
         End;
        if QtdeBaixar = DMContrato.QTotalNotaItemsaldo_disponivel.Value then
         begin
           DMContrato.QMudaStatusItemNF.Close;
           DMContrato.QMudaStatusItemNF.SetVariable('COD_NOTA_ITEM',DMContrato.QContratoVend_NotaCOD_NOTA_ITEM.Value);
           DMContrato.QMudaStatusItemNF.SetVariable('STATUS','S');
           DMContrato.QMudaStatusItemNF.ExecSQL;
         end;
      except
         DMContrato.pBaixa_Automatica := False;
         DMContrato.QContrato_VendMov.Cancel;
         DMContrato.QContrato_Vend.Cancel;
         DMOracle.DBCemapa.RollBack;
         Raise Exception.Create('Erro ao tentar incluir Movimento no contrato de venda');
      end;
      DMContrato.QContratoVend_Nota.Next;
   End;
   DMContrato.pBaixa_Automatica := False;
   DMOracle.DBCemapa.Commit;
   DMContrato.QContratoVend_Nota.Close;
   DMContrato.QContratoVend_Nota.SetVariable('DATA_INICIAL',ME_DataI.Text);
   DMContrato.QContratoVend_Nota.SetVariable('DATA_FINAL',ME_DataF.Text);
   DMContrato.QContratoVend_Nota.Open;
   DMContrato.QContrato_VendCons.Close;
   DMContrato.QContrato_VendCons.Open;
   DMContrato.QTotalNotaItem.Close;
   DMContrato.QTotalNotaItem.Open;
   DMContrato.QContrato_Vend.Close;
   DMContrato.QContrato_Vend.Open;
   ShowMessage('Baixa Efetuada com Sucesso!!');
end;

end.
