unit UImplantaProducaoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, QuickRpt, variants;

type
  TFImplantaProducaoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit10: TDBEdit;
    BTFilialCons: TBitBtn;
    BTLoteCons: TBitBtn;
    BTOrigemCons: TBitBtn;
    BTProdutoCons: TBitBtn;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    RelatrioEstoqueProduo1: TMenuItem;
    RelatrioProduoEstabelecida1: TMenuItem;
    ResumoProduo1: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    procedure BTFilialConsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BTLoteConsClick(Sender: TObject);
    procedure BTOrigemConsClick(Sender: TObject);
    procedure BTProdutoConsClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelatrioEstoqueProduo1Click(Sender: TObject);
    procedure RelatrioProduoEstabelecida1Click(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure ResumoProduo1Click(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImplantaProducaoCad: TFImplantaProducaoCad;

implementation

uses UEstoque_cl, UFilialCons, UFilial_cl, UTipoLoteCons, UTipoLote_cl,
  UOrigemProducaoCons, UOrigemProducao_cl, UProdutoCons, UProduto_cl,
  UImplantaProducaoCons, UEstoqueParam, UUsuario_cl, UREstoqueProducao,
  UBoletim_cl, URProducaoEstabelecida, UBoletimParam, UREstoqueProducao2,
  UOracle_cl;

{$R *.DFM}

procedure TFImplantaProducaoCad.BTFilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons=Nil then
     FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
    DMEstoque.QEstoqueProducaoCod_Filial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.value);
end;

procedure TFImplantaProducaoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMEstoque.QEstoqueProducao.open;
end;

procedure TFImplantaProducaoCad.BTLoteConsClick(Sender: TObject);
begin
  inherited;
  if FTipoLoteCons=Nil then
     FTipoLoteCons:=TFTipoLoteCons.Create(Application);
  if FTipoLoteCons.ShowModal=MrOk then
    DMEstoque.QEstoqueProducaoCod_Lote_Tipo.Text:=FloatToStr(DMTipoLote.QTipoLoteConsCod_Lote_Tipo.value);
end;

procedure TFImplantaProducaoCad.BTOrigemConsClick(Sender: TObject);
begin
  inherited;
  if FOrigemProducaoCons=Nil then
     FOrigemProducaoCons:=TFOrigemProducaoCons.Create(Application);
  if FOrigemProducaoCons.ShowModal=MrOk then
    DMEstoque.QEstoqueProducaoCod_origem_Producao.Text:=FloatToStr(DMOrigemProducao.QOrigemProducaoConsCod_Origem_Producao.value);
end;

procedure TFImplantaProducaoCad.BTProdutoConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons=Nil then
     FProdutoCons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal=MrOk then
    DMEstoque.QEstoqueProducaoCod_Produto.Text:=FloatToStr(DMProduto.QProdutoConsCod_Produto.value);
end;

procedure TFImplantaProducaoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.state in [DSInsert,DSEdit]then
  begin
    FImplantaProducaoCad.BTFilialCons.Enabled:=true;
    FImplantaProducaoCad.BTLoteCons.Enabled:=true;
    FImplantaProducaoCad.BTOrigemCons.Enabled:=true;
    FImplantaProducaoCad.BTProdutoCons.Enabled:=true;
  end
  else
  begin
    FImplantaProducaoCad.BTFilialCons.Enabled:=false;
    FImplantaProducaoCad.BTLoteCons.Enabled:=false;
    FImplantaProducaoCad.BTOrigemCons.Enabled:=false;
    FImplantaProducaoCad.BTProdutoCons.Enabled:=false;
  end;
end;

procedure TFImplantaProducaoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FImplantaProducaoCons = Nil then
    FImplantaProducaoCons := TFImplantaProducaoCons.Create(Application);
  If FImplantaProducaoCons.ShowModal = mrOk then
  With DMEstoque do
  Begin
    QEstoqueProducao.Close;
    QEstoqueProducao.SetVariable('PK',QEstoqueProducaoConsCod_Estoque_Producao.Value);
    QEstoqueProducao.Open;
  End;
end;

procedure TFImplantaProducaoCad.RelatrioEstoqueProduo1Click(
  Sender: TObject);
begin
  inherited;
  If FEstoqueParam=Nil then
    FEstoqueParam:=TFEstoqueParam.Create(Application);
    FEstoqueParam.PGRelatorio.Pages[12].TabVisible:=true;
  If FEstoqueParam.ShowModal=mrOk then
    Begin
      if (FEstoqueParam.ME12Data_I.Text = '' )or (FEstoqueParam.ME12Data_F.Text = '' ) then
        raise exception.Create('Informe o período');
      DmUsuario.Checar_Filial_Usuario( Trim(FEstoqueParam.ME12Filial.Text),'ESTOQUE');
         With DMEstoque do
         Begin
           QREstoqueProducao.Close;
           If Trim(FEstoqueParam.Me12Produto.Text) <> '' Then
             QREstoqueProducao.SetVariable('COD_PRODUTO',StrToInt(Trim(FEstoqueParam.Me12Produto.Text)))
           Else
             QREstoqueProducao.SetVariable('COD_PRODUTO',Null);

           If Trim(FEstoqueParam.Me12Origem.Text) <> '' Then
             QREstoqueProducao.SetVariable('COD_ORIGEM_PRODUCAO',StrToInt(Trim(FEstoqueParam.Me12Origem.Text)))
           Else
              QREstoqueProducao.SetVariable('COD_ORIGEM_PRODUCAO',Null);

           If Trim(FEstoqueParam.Me12Filial.Text)<>'' then
             QREstoqueProducao.SetVariable('COD_FILIAL',StrToInt(FEstoqueParam.Me12Filial.Text))
           Else
              QREstoqueProducao.SetVariable('COD_FILIAL',Null);

           QREstoqueProducao.SetVariable('DATA_I',FEstoqueParam.ME12Data_I.Text);
           QREstoqueProducao.SetVariable('DATA_F',FEstoqueParam.ME12Data_F.Text);

           QREstoqueProducao.Open;
         End;
         If FREstoqueProducao = Nil then
           FREstoqueProducao:=TFREstoqueProducao.Create(Application);

         If FEstoqueParam.RGPreview.ItemIndex=0 then
           FREstoqueProducao.QRPrimario.Preview
         Else
           FREstoqueProducao.QRPrimario.Print;
         DMEstoque.QREstoqueProducao.Close;
    End;
end;

procedure TFImplantaProducaoCad.RelatrioProduoEstabelecida1Click(
  Sender: TObject);
begin
  inherited;
  if FBoletimParam = Nil then
    FBoletimParam:= TFBoletimParam.Create(Application);
  FBoletimParam.PGRelatorio.Pages[4].TabVisible := True;
  if FBoletimParam.ShowModal = mrOk then
  with DMBoletim do
  begin
    QRProducaoEstabelecida.Close;
    if Trim(FBoletimParam.ME4Filial.Text) = '' then
      QRProducaoEstabelecida.SetVariable('FILIAL',Null)
    else
      QRProducaoEstabelecida.SetVariable('FILIAL',StrToInt(Trim(FBoletimParam.ME4Filial.Text)));
    If Trim(FBoletimParam.ME4ClasseInicial.text) <> '' then
      QRProducaoEstabelecida.SetVariable('CLASSE_INICIAL',FBoletimParam.ME4ClasseInicial.text)
    Else
      QRProducaoEstabelecida.SetVariable('CLASSE_INICIAL',Null);
    if Trim(FBoletimParam.ME4Produto.Text) = '' then
      QRProducaoEstabelecida.SetVariable('PRODUTO',Null)
    else
      QRProducaoEstabelecida.SetVariable('PRODUTO',StrToInt(Trim(FBoletimParam.ME4Produto.Text)));
    if Trim(FBoletimParam.ME4Lote.Text) = '' then
      QRProducaoEstabelecida.SetVariable('LOTE',Null)
    else
      QRProducaoEstabelecida.SetVariable('LOTE',StrToInt(Trim(FBoletimParam.ME4Lote.Text)));
    QRProducaoEstabelecida.Open;
    if FRProducaoEstabelecida = Nil then
      FRProducaoEstabelecida := TFRProducaoEstabelecida.Create(Application);
    FRProducaoEstabelecida.QRLFilial.Caption := 'Filial: '+Trim(FBoletimParam.ME4Filial.Text)+' '+FBoletimParam.Ed4Filial.Text;
    if FBoletimParam.RGPreview.ItemIndex = 0 then
       FRProducaoEstabelecida.QRPrimario.Preview
    else
      FRProducaoEstabelecida.QRPrimario.Print;
    QRProducaoEstabelecida.Close;
  end;
end;

procedure TFImplantaProducaoCad.SBAlterarClick(Sender: TObject);
begin
  inherited;
  DSPrimario.DataSet.Cancel;
end;

procedure TFImplantaProducaoCad.ResumoProduo1Click(Sender: TObject);
begin
  inherited;
  If FEstoqueParam=Nil then
    FEstoqueParam:=TFEstoqueParam.Create(Application);
    FEstoqueParam.PGRelatorio.Pages[12].TabVisible:=true;
  If FEstoqueParam.ShowModal=mrOk then
    Begin
      if (FEstoqueParam.ME12Data_I.Text = '' )or (FEstoqueParam.ME12Data_F.Text = '' ) then
        raise exception.Create('Informe o período');
      DmUsuario.Checar_Filial_Usuario( Trim(FEstoqueParam.ME12Filial.Text),'ESTOQUE');
         With DMEstoque do
         Begin
           QREstoqueProducao2.Close;
           If Trim(FEstoqueParam.Me12Produto.Text) <> '' Then
             QREstoqueProducao2.SetVariable('COD_PRODUTO',StrToInt(Trim(FEstoqueParam.Me12Produto.Text)))
           Else
             QREstoqueProducao2.SetVariable('COD_PRODUTO',Null);

           If Trim(FEstoqueParam.Me12Origem.Text) <> '' Then
             QREstoqueProducao2.SetVariable('COD_ORIGEM_PRODUCAO',StrToInt(Trim(FEstoqueParam.Me12Origem.Text)))
           Else
              QREstoqueProducao2.SetVariable('COD_ORIGEM_PRODUCAO',Null);

           If Trim(FEstoqueParam.Me12Filial.Text)<>'' then
             QREstoqueProducao2.SetVariable('COD_FILIAL',StrToInt(FEstoqueParam.Me12Filial.Text))
           Else
              QREstoqueProducao2.SetVariable('COD_FILIAL',Null);

           QREstoqueProducao2.SetVariable('DATA_I',FEstoqueParam.ME12Data_I.Text);
           QREstoqueProducao2.SetVariable('DATA_F',FEstoqueParam.ME12Data_F.Text);

           case FEstoqueParam.RG12Turno.ItemIndex of
             0:QREstoqueProducao2.SetVariable('IND_TURNO','M');
             1:QREstoqueProducao2.SetVariable('IND_TURNO','T');
             2:QREstoqueProducao2.SetVariable('IND_TURNO','N');
             3:QREstoqueProducao2.SetVariable('IND_TURNO',null);
           end;
             
            case FEstoqueParam.RG12Linha.ItemIndex of
             0:QREstoqueProducao2.SetVariable('NUM_LINHA',1);
             1:QREstoqueProducao2.SetVariable('NUM_LINHA',2);
             2:QREstoqueProducao2.SetVariable('NUM_LINHA',3);
             3:QREstoqueProducao2.SetVariable('NUM_LINHA',null);
           end;

           QREstoqueProducao2.Open;
         End;
         If FREstoqueProducao2 = Nil then
           FREstoqueProducao2:=TFREstoqueProducao2.Create(Application);

         case FEstoqueParam.RG12Turno.ItemIndex of
           0:FREstoqueProducao2.QRLTurno.caption:='Turno: Manhã';
           1:FREstoqueProducao2.QRLTurno.caption:='Turno: Tarde';
           2:FREstoqueProducao2.QRLTurno.caption:='Turno: Noite';
           3:FREstoqueProducao2.QRLTurno.caption:='Turno: Todos';
         end;

         case FEstoqueParam.RG12Linha.ItemIndex of
           0:FREstoqueProducao2.QRLLinha.caption:='Linha: 1';
           1:FREstoqueProducao2.QRLLinha.caption:='Linha: 2';
           2:FREstoqueProducao2.QRLLinha.caption:='Linha: 3';
           3:FREstoqueProducao2.QRLLinha.caption:='Linha: Todas';
         end;


         If FEstoqueParam.RGPreview.ItemIndex=0 then
           FREstoqueProducao2.QRPrimario.Preview
         Else
           FREstoqueProducao2.QRPrimario.Print;
         DMEstoque.QREstoqueProducao2.Close;
    End;
end;

procedure TFImplantaProducaoCad.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  if DbEdit4.Text <> '' then
    begin
      if DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+DbEdit4.Text) <> 'COMERCIAL' then
      begin
        MessageBox(FImplantaProducaoCad.Handle,'Produto de Tipo Inválido - É permitido incluir apenas produtos do Tipo COMERCIAL',
                   'ERRO',MB_ICONERROR or MB_OK);
        DBEdit4.SetFocus;
      end;
    end;

end;

end.
